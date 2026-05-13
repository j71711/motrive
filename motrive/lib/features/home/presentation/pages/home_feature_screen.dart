import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/pages/add_car_card_feature_widget.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_feature_widget.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/pages/maintenance_alert_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<HomeCubit>();

    return BlocProvider(
      create: (_) =>
          EmergencyContactCubit(GetIt.I.get())..getEmergencyContactMethod(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          leading: IconButton.filled(
            onPressed: () => context.push(Routes.profile),
            icon: Icon(Icons.person),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final screenSize = MediaQuery.of(context).size;

                        return Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.all(20),
                            child: Container(
                              width: screenSize.width * 0.85,
                              height: screenSize.height * 0.60,
                              padding: const EdgeInsets.all(16),
                              child: const AddCarCardFeatureWidget(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 20),
              SosFeatureWidget(),
              MaintenanceAlertFeatureWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
