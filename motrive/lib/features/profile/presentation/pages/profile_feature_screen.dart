import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/theme/theme_cubit.dart';
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
          'Settings',
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
                    _divider(context),

                    /// PROFILE
                    _settingsTile(
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

                    _divider(context),

                    /// EMERGENCY
                    _settingsTile(
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

                    _divider(context),

                    /// THEME
                    _settingsTile(
                      context,
                      icon: Icons.dark_mode_outlined,
                      title: 'Display Theme',

                      subtitle: Theme.of(context).brightness == Brightness.dark
                          ? 'Dark Mode'
                          : 'Light Mode',

                      trailing: MiniThemeToggle(
                        isDark: Theme.of(context).brightness == Brightness.dark,

                        onChanged: (value) {
                          context.read<ThemeCubit>().changeTheme(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                      ),
                    ),

                    _divider(context),

                    /// LANGUAGE
                    _settingsTile(
                      context,
                      icon: Icons.language_rounded,
                      title: 'Language',
                      subtitle: 'English',
                      onTap: () {},
                    ),

                    _divider(context),

                    /// AGREEMENT
                    _settingsTile(
                      context,
                      icon: Icons.assignment_returned_outlined,
                      title: 'Agreement',
                      subtitle: 'Agreed upon terms',
                      onTap: () {},
                    ),

                    _divider(context),

                    /// SIGN OUT
                    const SignOutFeatureWidget(),

                    _divider(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _divider(BuildContext context) {
    return Divider(
      height: 1,
      indent: 22,
      endIndent: 22,

      color: Theme.of(context).colorScheme.outline.withValues(alpha: .08),
    );
  }

  static Widget _settingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    bool isLogout = false,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

          child: Row(
            children: [
              /// ICON
              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: isLogout
                      ? Theme.of(
                          context,
                        ).colorScheme.error.withValues(alpha: .1)
                      : Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .1),
                ),

                child: Icon(
                  icon,
                  size: 24,

                  color: isLogout
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                ),
              ),

              const Gap(16),

              /// TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,

                        color: isLogout
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    const Gap(4),

                    Text(
                      subtitle,

                      style: TextStyle(
                        fontSize: 14,

                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: .55),
                      ),
                    ),
                  ],
                ),
              ),

              trailing ??
                  Icon(
                    Icons.chevron_right_rounded,

                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: .35),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniThemeToggle extends StatelessWidget {
  final bool isDark;
  final Function(bool) onChanged;

  const MiniThemeToggle({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isDark),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        height: 42,
        width: 78,

        padding: const EdgeInsets.all(4),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          color: isDark
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,

          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: .15),
          ),
        ),

        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),

          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,

          child: Container(
            height: 32,
            width: 32,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: Theme.of(context).colorScheme.surface,

              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 2),

                  color: Colors.black.withValues(alpha: .12),
                ),
              ],
            ),

            child: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,

              size: 18,

              color: isDark
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
