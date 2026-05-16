import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:motrive/features/profile/presentation/cubit/profile_state.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/pages/emergency_contact_feature_widget.dart';
import 'package:motrive/features/profile/sub/sign_out/presentation/pages/sign_out_feature_widget.dart';


class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          EmergencyContactCubit(GetIt.I.get())..getEmergencyContactMethod(),
     child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: EmergencyContactFeatureWidget(),
                  ),

                  const SizedBox(height: 16),

                  const SignOutFeatureWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
 