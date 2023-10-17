import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nxt_solutions_task/reservations/data/models/Reservation.dart';

import '../data/repositories/reservation_repository.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  List<Reservation> reservations = [];
  ReservationRepository reservationRepository;

  ReservationsBloc({required this.reservationRepository})
      : super(ReservationsInitial()) {
    on<LoadReservationsEvent>(_onLoadReservation);
  }

  void _onLoadReservation(LoadReservationsEvent event, Emitter emit) async {
    emit(LoadingReservationsState());
    try {
      reservations = await reservationRepository.fetchAllReservation();
    } catch (e) {
      emit(ErrorReservationsState(message: e.toString()));
    }
  }
}
