import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nxt_solutions_task/reservations/bloc/reservations_bloc.dart';
import 'package:nxt_solutions_task/reservations/data/repositories/reservation_repository.dart';

import '../reservations/data/dataproviders/reservation_data_provider.dart';
import '../resources/theme/cubit/theme_cubit.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                ReservationRepository(dataProvider: ReservationDataProvider()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReservationsBloc(
              reservationRepository:
                  RepositoryProvider.of<ReservationRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: child,
      ),
    );
  }
}
