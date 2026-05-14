
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_cubit.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_state.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/show_sos_options..dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';

class SosFeatureWidget extends StatelessWidget {
  const SosFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SosCubit(GetIt.I.get())),
        BlocProvider(
          create: (_) =>
              EmergencyContactCubit(GetIt.I.get())..getEmergencyContactMethod(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final sosCubit = context.read<SosCubit>();

          return BlocListener<SosCubit, SosState>(
            listener: (context, state) {
              if (state is SosSendEmailSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('SOS email sent successfully')),
                );
              }

              if (state is SosErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  showSosOptions(context, sosCubit);
                },
                label: const Text('SOS'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
