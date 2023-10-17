import 'package:nxt_solutions_task/core/network/apis_constants.dart';
import 'package:nxt_solutions_task/core/network/networkhelper.dart';
import 'package:nxt_solutions_task/core/network/status_code.dart';

import '../../../core/network/custom_response.dart';
import '../models/Reservation.dart';

abstract class ReservationDataProviderI {
  Future<List<Reservation>> fetchAllReservation();
}

class ReservationDataProvider implements ReservationDataProviderI {
  @override
  Future<List<Reservation>> fetchAllReservation() async {
    List<Reservation> reservations = [];
    CustomResponse customResponse = await NetworkHelper.instance
        .get(url: APIsConstants.userEventsURL, setAuthToken: true);
    if (customResponse.statusCode == StatusCode.success) {
      var reservationsData = customResponse.data['reservations'];

      for (var r in reservationsData) {
        try {
          reservations.add(Reservation.fromJson(r));
        } catch (_) {}
      }
    } else {
      throw customResponse.errorMessage ?? '';
    }

    return reservations;
  }
}
