// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nxt_solutions_task/reservations/data/dataproviders/reservation_data_provider.dart';
import 'package:nxt_solutions_task/reservations/data/models/Reservation.dart';
import 'package:nxt_solutions_task/reservations/data/repositories/reservation_repository.dart';

void main() {
  test("get API data", () async {
    WidgetsFlutterBinding.ensureInitialized(); // Initialize the binding
    List<Reservation> reservations =
        await ReservationRepository(dataProvider: ReservationDataProvider())
            .fetchAllReservation();
    expect(reservations.isNotEmpty, true);
  });

  test("reservations count is 2", () async {
    WidgetsFlutterBinding.ensureInitialized(); // Initialize the binding
    List<Reservation> reservations =
        await ReservationRepository(dataProvider: ReservationDataProvider())
            .fetchAllReservation();
    expect(reservations.length, 2);
  });
}
