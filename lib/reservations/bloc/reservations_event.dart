part of 'reservations_bloc.dart';

abstract class ReservationsEvent extends Equatable {}

class LoadReservationsEvent extends ReservationsEvent {
  @override
  List<Object?> get props => [];
}
