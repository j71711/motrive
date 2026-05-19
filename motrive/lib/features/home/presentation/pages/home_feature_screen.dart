import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/extensions/string_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/presentation/cubit/home_state.dart';
import 'package:motrive/features/home/presentation/widgets/circle_Button.dart';
import 'package:motrive/features/home/presentation/widgets/action_card.dart';
import 'package:motrive/features/home/presentation/widgets/section_title.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/pages/add_expense_feature_widget.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/pages/chat_bot_feature_widget.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_feature_widget.dart';
import 'package:motrive/features/parking/presentation/cubit/parking_cubit.dart';
import 'package:motrive/features/sub/add_reminder/presentation/pages/add_reminder_feature_widget.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/pages/maintenance_alert_feature_widget.dart';
import 'package:motrive/features/sub/vehicle_card/presentation/pages/vehicle_card_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<HomeCubit>();

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
                    onTap: () => context.push(Routes.reminders),
                  ),
                ],
              ),

              const Gap(24),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Text(
                    '${'good_morning'.tr()}, ${state is HomeSuccessState ? state.user.fullName?.capitalizeEachWord : ''}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -.2,
                    ),
                  );
                },
              ),

              const Gap(4),

              Text(
                'your_car_assistant'.tr(),
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
                  color: Color(0xff111827),
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
                            color: Color(0xff111827),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.directions_car_filled_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'vehicle_status'.tr(),
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              'everything_looks_ready'.tr(),
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

              SectionTitle(title: 'emergency'.tr()),

              const Gap(12),

              const SosFeatureWidget(),

              const Gap(28),

              SectionTitle(title: 'quick_actions'.tr()),
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
                  MaintenanceAlertFeatureWidget(),

                  ActionCard(
                    title: 'location'.tr(),
                    subtitle: 'save_parking'.tr(),
                    icon: Icons.location_on_rounded,
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () async {
                      await ParkingCubit(
                        GetIt.I.get(),
                      ).manualSaveParkingMethod();

                      if (!context.mounted) return;

                      context.go(Routes.parking, extra: true);

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('parking_location_saved'.tr()),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),

                  ActionCard(
                    title: 'expenses'.tr(),
                    subtitle: 'track_costs'.tr(),
                    icon: Icons.payments_rounded,
                    iconColor: Theme.of(context).colorScheme.tertiary,
                    onTap: () {
                      context.showBottomSheet(
                        widget: const AddExpenseFeatureWidget(),
                      );
                    },
                  ),
                  ActionCard(
                    title: 'notifications'.tr(),
                    subtitle: 'custom'.tr(),
                    icon: Icons.notifications_active_rounded,
                    iconColor: Theme.of(context).colorScheme.error,
                    onTap: () async => context.showBottomSheet(
                      widget: AddReminderFeatureWidget(),
                    ),
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
