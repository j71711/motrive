import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/presentation/cubit/cars_info_cubit.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/presentation/cubit/cars_info_state.dart';

class CarsInfoFeatureWidget extends StatelessWidget {
  const CarsInfoFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsInfoCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CarsInfoCubit>();
          return Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    cubit.search(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search vehicle',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<CarsInfoCubit, CarsInfoState>(
                  builder: (context, state) {
                    switch (state) {
                      case CarsInfoLoadingState _:
                        return const LoadingWidget();
                      case CarsInfoSuccessState _:
                        return ListView.builder(
                          itemCount: state.cars.length,
                          itemBuilder: (context, index) {
                            final car = state.cars[index];

                            return ListTile(
                              onTap: () => context.pop(car),
                              leading: const Icon(Icons.drive_eta),
                              title: Text(car.make),
                              subtitle: Text(car.model),
                              trailing: Text(car.year.toString()),
                            );
                          },
                        );
                      case CarsInfoErrorState _:
                        return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    context.pop();
                  },
                  label: const Text('add Vehicle'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
