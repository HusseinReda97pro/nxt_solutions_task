part of 'reservations_bloc.dart';

abstract class ReservationsState extends Equatable {
  const ReservationsState();
}

class ReservationsInitial extends ReservationsState {
  @override
  List<Object> get props => [];
}

class LoadingReservationsState extends ReservationsState {
  @override
  List<Object?> get props => [];
}

class LoadedReservationsState extends ReservationsState {
  @override
  List<Object?> get props => [];
}

class ErrorReservationsState extends ReservationsState {
  final String message;
  const ErrorReservationsState({required this.message});
  @override
  List<Object?> get props => [message];
}
