import '../dataproviders/reservation_data_provider.dart';
import '../models/Reservation.dart';

class ReservationRepository {
  ReservationDataProviderI dataProvider;
  ReservationRepository({required this.dataProvider});

  Future<List<Reservation>> fetchAllReservation() {
    return dataProvider.fetchAllReservation();
  }
}
