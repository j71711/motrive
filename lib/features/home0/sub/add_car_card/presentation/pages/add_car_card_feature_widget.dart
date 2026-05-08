import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home0/sub/add_car_card/presentation/cubit/add_car_card_cubit.dart';


class AddCarCardFeatureWidget extends StatelessWidget {
  const AddCarCardFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCardCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<AddCarCardCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
