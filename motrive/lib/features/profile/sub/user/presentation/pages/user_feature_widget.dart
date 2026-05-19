import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/profile/sub/user/presentation/cubit/user_cubit.dart';
import 'package:motrive/features/profile/sub/user/presentation/cubit/user_state.dart';
import 'package:motrive/features/profile/sub/user/presentation/pages/%20show_modal_bottom_sheet.dart';
import 'package:motrive/features/profile/sub/user/presentation/pages/profile_title.dart';

class UserFeatureWidget extends StatelessWidget {
  const UserFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(GetIt.I.get())..getUserMethod(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is UserSuccessState) {
            final user = state.user;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: .1),
                          child: Icon(
                            Icons.person_rounded,
                            size: 44,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const Gap(14),
                        Text(
                         user.fullName ?? 'no_name'.tr(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          user.email ?? 'no_email'.tr(),
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: .55),
                            fontSize: 15,
                          ),
                        ),
                        const Gap(18),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showEditProfileBottomSheet(
                                context,
                                context.read<UserCubit>(),
                                user,
                              );
                            },
                            icon: const Icon(Icons.edit_rounded),
                            label: Text('edit_profile'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        profileTile(
                          context,
                          icon: Icons.email_outlined,
                          title: 'email'.tr(),
                          value: user.email ?? 'not_added'.tr(),
                        ),
                        divider(context),
                        profileTile(
                          context,
                          icon: Icons.phone_outlined,
                          title: 'phone'.tr(),
                          value: user.phone ?? 'not_added'.tr(),
                        ),
                        divider(context),
                        profileTile(
                          context,
                          icon: Icons.person_outline_rounded,
                          title: 'gender'.tr(),
                          value: user.gender ?? 'not_added'.tr(),
                        ),
                        divider(context),
                        profileTile(
                          context,
                          icon: Icons.calendar_month_outlined,
                         title: 'date_of_birth'.tr(),
                          value: user.dateOfBirth != null
                              ? '${user.dateOfBirth!.day}/${user.dateOfBirth!.month}/${user.dateOfBirth!.year}'
                              : 'Not added',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
