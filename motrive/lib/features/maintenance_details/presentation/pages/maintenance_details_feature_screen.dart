import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_cubit.dart';

class MaintenanceDetailsFeatureScreen extends StatelessWidget {
  const MaintenanceDetailsFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<MaintenanceDetailsCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('MaintenanceDetails Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
