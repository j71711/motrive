import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/widgets/cirle_widget.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/presentation/widgets/glass_card.dart';
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
    final _ = context.read<HomeCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
          color: Theme.of(context).colorScheme.surface,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 410,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(38),
                  bottomRight: Radius.circular(38),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: -70,
                    left: -60,
                    child: Circle(size: 180, opacity: .12),
                  ),
                  const Positioned(
                    top: 70,
                    right: -45,
                    child: Circle(size: 140, opacity: .12),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlassContainer.clearGlass(
                                height: 54,
                                width: 54,
                                borderRadius: BorderRadius.circular(100),
                                child: IconButton(
                                  onPressed: () {
                                    context.push(Routes.profile);
                                  },
                                  icon: Icon(
                                    Icons.person_outline_rounded,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                                ),
                              ),
                              GlassContainer.clearGlass(
                                height: 54,
                                width: 54,
                                borderRadius: BorderRadius.circular(100),
                                child: Icon(
                                  Icons.notifications_none_rounded,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ],
                          ),
                          const Gap(8),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            'Manage your car easily',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.surface.withValues(alpha: .85),
                              fontSize: 12,
                            ),
                          ),

                          const VehicleCardFeatureWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),

                  sectionTitle(context, 'Emergency'),

                  const Gap(16),
                  const SosFeatureWidget(),

                  const Gap(16),
                  const Gap(16),
                  sectionTitle(context, 'Quick Access'),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.45,
                    children: [
                      buildGlassCard(
                        context: context,
                        icon: Icons.build_rounded,
                        title: 'Maintenance',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.surface,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28),
                              ),
                            ),
                            builder: (_) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: MaintenanceAlertFeatureWidget(),
                              );
                            },
                          );
                        },
                      ),
                      buildGlassCard(
                        context: context,
                        icon: Icons.location_on_outlined,
                        title: 'Save Location',
                        onTap: () async {
                          await ParkingCubit(
                            GetIt.I.get(),
                          ).manualSaveParkingMethod();

                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Parking location saved'),
                            ),
                          );
                        },
                      ),
                      buildGlassCard(
                        context: context,
                        icon: Icons.notifications_none_rounded,
                        title: 'Notification',
                        onTap: () {},
                      ),
                      buildGlassCard(
                        context: context,
                        icon: Icons.attach_money_rounded,
                        title: 'Expenses',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.background,
                            elevation: 0,
                            builder: (_) {
                              return SizedBox(
                                height: 70.sh,
                                child: const AddExpenseFeatureWidget(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  const Gap(100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
