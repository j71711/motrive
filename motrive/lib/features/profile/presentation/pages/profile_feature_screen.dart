import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/theme/app_settings_state.dart';
import 'package:motrive/features/profile/presentation/widgets/divder.dart';
import 'package:motrive/features/profile/presentation/widgets/toggle_widget.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/pages/emergency_contact_feature_widget.dart';
import 'package:motrive/features/profile/sub/sign_out/presentation/pages/sign_out_feature_widget.dart';
import 'package:motrive/features/profile/sub/user/presentation/pages/user_feature_widget.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,

        titleSpacing: 20,

        title: Text(
         'settings'.tr(),
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),

        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: Container(
              height: 42,
              width: 42,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),

              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Gap(8),

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,

                  borderRadius: BorderRadius.circular(32),

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 10),

                      color: Colors.black.withValues(alpha: .03),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    divider(context),

                    /// PROFILE
                    settingsTile(
                      context,
                      icon: Icons.person_outline_rounded,
                      title: 'Profile',
                      subtitle: 'Personal information',

                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,

                          builder: (_) {
                            return Container(
                              height: MediaQuery.of(context).size.height * .90,

                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,

                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(34),
                                ),
                              ),

                              child: const UserFeatureWidget(),
                            );
                          },
                        );
                      },
                    ),

                    divider(context),

                    /// EMERGENCY
                    settingsTile(
                      context,
                      icon: Icons.shield_outlined,
                      title: 'Emergency Contacts',
                      subtitle: 'Manage trusted contacts',

                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,

                          builder: (_) {
                            return BlocProvider(
                              create: (_) =>
                                  EmergencyContactCubit(GetIt.I.get())
                                    ..getEmergencyContactMethod(),

                              child: Wrap(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),

                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.surface,

                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(34),
                                      ),
                                    ),

                                    child: EmergencyContactFeatureWidget(),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),

                    divider(context),

                    /// THEME
                    settingsTile(
                      context,
                      icon: Icons.dark_mode_outlined,
                      title: 'Display Theme',

                      subtitle: Theme.of(context).brightness == Brightness.dark
                          ? 'Dark Mode'
                          : 'Light Mode',

                      trailing:
                      
                      CustomToggle(
                        value: Theme.of(context).brightness == Brightness.dark,

                        activeIcon: Icons.dark_mode_rounded,
                        inactiveIcon: Icons.light_mode_rounded,

                        onChanged: (value) {
                          context.read<ThemeCubit>().changeTheme(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      ), 
                    ),

                    divider(context),

                    /// LANGUAGE
                    settingsTile(
                      context,
                      icon: Icons.language_rounded,
                      title: 'Language',

                      subtitle:
                          context
                                  .watch<ThemeCubit>()
                                  .state
                                  .locale
                                  .languageCode ==
                              'ar'
                          ? 'Arabic'
                          : 'English',

                      trailing: CustomToggle(
                        value:
                            context
                                .watch<ThemeCubit>()
                                .state
                                .locale
                                .languageCode ==
                            'ar',

                        activeIcon: Icons.language_rounded,
                        inactiveIcon: Icons.translate_rounded,

                        onChanged: (value) async {
                          final locale = Locale(value ? 'ar' : 'en');

                          await context.read<ThemeCubit>().changeLanguage(
                            locale,
                          );

                          if (context.mounted) {
                            context.setLocale(locale);
                          }
                        },
                      ),
                    ),
                    divider(context),

                    /// AGREEMENT
                    settingsTile(
                      context,
                      icon: Icons.assignment_returned_outlined,
                      title: 'Agreement',
                      subtitle: 'Agreed upon terms',
                      onTap: () {},
                    ),

                    divider(context),

                    /// SIGN OUT
                    const SignOutFeatureWidget(),

                    divider(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
