import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/presentation/widgets/circle_Button.dart';
import 'package:motrive/features/home/presentation/widgets/action_card.dart';
import 'package:motrive/features/home/presentation/widgets/section_title.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/pages/add_expense_feature_widget.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/pages/chat_bot_feature_widget.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_feature_widget.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_cubit.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/pages/maintenance_alert_feature_widget.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/pages/vehicle_card_feature_widget.dart';
import 'package:sizer/sizer.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final  _ =  context.read<HomeCubit>();


    return Scaffold(
   

      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ChatBotFeatureWidget()),
          );
        },
        child: Icon(
          Icons.chat_bubble_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 26,
        ),
      ),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleButton(
                    icon: Icons.person_rounded,
                    onTap: () => context.push(Routes.profile),
                  ),
                  const Spacer(),
                  CircleButton(
                    icon: Icons.notifications_none_rounded,
                    onTap: () {},
                  ),
                ],
              ),

              const Gap(24),

              Text(
                'Good morning',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -.2,
                ),
              ),

              const Gap(4),

              Text(
                'Your car assistant',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                  letterSpacing: -.5,
                ),
              ),

              const Gap(24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color:  Color(0xff111827),
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            color:  Color(0xff111827),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.directions_car_filled_rounded,
                            color:Colors.white,
                            size: 26,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicle Status',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              'Everything looks ready',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const VehicleCardFeatureWidget(),
                  ],
                ),
              ),

              const Gap(28),

              SectionTitle(title: 'Emergency'),

              const Gap(12),

              const SosFeatureWidget(),

              const Gap(28),

              SectionTitle(title: 'Quick Actions'),
              const Gap(14),

              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1,
                ),
                children: [
                  ActionCard(
                    title: 'Maintenance',
                    subtitle: 'Check alerts',
                    icon: Icons.car_repair_rounded,
                    iconColor: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                        ),
                        builder: (_) {
                          return const Padding(
                            padding: EdgeInsets.all(18),
                            child: MaintenanceAlertFeatureWidget(),
                          );
                        },
                      );
                    },
                  ),

                  ActionCard(
                    title: 'Location',
                    subtitle: 'Save parking',
                    icon: Icons.location_on_rounded,
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () async {
                      await ParkingCubit(
                        GetIt.I.get(),
                      ).manualSaveParkingMethod();

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Parking location saved'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'Expenses',
                    subtitle: 'Track costs',
                    icon: Icons.payments_rounded,
                    iconColor: Theme.of(context).colorScheme.tertiary,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                        ),
                        builder: (_) {
                          return SizedBox(
                            height: 70.sh,
                            child: const AddExpenseFeatureWidget(),
                          );
                        },
                      );
                    },
                  ),

                  ActionCard(
                    title: 'Notifications',
                    subtitle: 'custom',
                    icon: Icons.notifications_active_rounded,
                    iconColor: Theme.of(context).colorScheme.error,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
