import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_feature_widget.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/pages/maintenance_alert_feature_widget.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/pages/add_expense_feature_widget.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/pages/chat_bot_feature_widget.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/pages/vehicle_card_feature_widget.dart';
import 'package:sizer/sizer.dart';

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
        body: Column(
          children: [
            VehicleCardFeatureWidget(),
            const SizedBox(height: 20),
            SosFeatureWidget(),
            MaintenanceAlertFeatureWidget(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.5,
              children: [
                buildMenuItem(Icons.build, 'Maintenance', () {}),
                buildMenuItem(Icons.location_on, 'Save location', () {}),
                buildMenuItem(Icons.notifications, 'Notification', () {}),
                buildMenuItem(Icons.money, 'Add Expense', () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.background,
                    elevation: 0,
                    builder: (context) => SizedBox(
                      height: 70.sh,
                      child: const AddExpenseFeatureWidget(),
                    ),
                  );
                }),
              ],
            ),
            Gap(16),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatBotFeatureWidget(),
                  ),
                );
              },
              child: Icon(Icons.message_outlined, size: 32),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: Icon(icon, size: 32, color: AppColors.secondary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16, fontWeight: .bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
