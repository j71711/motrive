import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/profile/sub/user/presentation/cubit/user_cubit.dart';
import 'package:motrive/features/profile/sub/user/presentation/cubit/user_state.dart';

class UserFeatureWidget extends StatelessWidget {
  const UserFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(GetIt.I.get())..getUserMethod(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final theme = Theme.of(context);

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
                      color: theme.colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor:
                              theme.colorScheme.primary.withValues(alpha: .1),
                          child: Icon(
                            Icons.person_rounded,
                            size: 44,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const Gap(14),
                        Text(
                          user.fullName ?? 'No Name',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          user.email ?? 'No email',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: .55),
                            fontSize: 15,
                          ),
                        ),
                        const Gap(18),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              _showEditProfileBottomSheet(
                                context,
                                context.read<UserCubit>(),
                                user,
                              );
                            },
                            icon: const Icon(Icons.edit_rounded),
                            label: const Text('Edit Profile'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        _profileTile(
                          context,
                          icon: Icons.email_outlined,
                          title: 'Email',
                          value: user.email ?? 'Not added',
                        ),
                        _divider(context),
                        _profileTile(
                          context,
                          icon: Icons.phone_outlined,
                          title: 'Phone',
                          value: user.phone ?? 'Not added',
                        ),
                        _divider(context),
                        _profileTile(
                          context,
                          icon: Icons.person_outline_rounded,
                          title: 'Gender',
                          value: user.gender ?? 'Not added',
                        ),
                        _divider(context),
                        _profileTile(
                          context,
                          icon: Icons.calendar_month_outlined,
                          title: 'Date of Birth',
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

Widget _profileTile(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String value,
}) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    child: Row(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.primary.withValues(alpha: .1),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        const Gap(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const Gap(4),
              Text(
                value,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _divider(BuildContext context) {
  return Divider(
    height: 1,
    indent: 78,
    endIndent: 18,
    color: Theme.of(context).colorScheme.outline.withValues(alpha: .08),
  );
}void _showEditProfileBottomSheet(
  BuildContext context,
  UserCubit cubit,
  dynamic user,
) {
  final theme = Theme.of(context);

  final fullNameController = TextEditingController(
    text: user.fullName ?? '',
  );

  final phoneController = TextEditingController(
    text: user.phone ?? '',
  );

  DateTime? selectedDate = user.dateOfBirth;

  String selectedGender =
      user.gender == 'female'
          ? 'Female'
          : user.gender == 'male'
              ? 'Male'
              : 'Male';

  InputDecoration inputDecoration(
    String label,
    IconData icon,
  ) {
    return InputDecoration(
      labelText: label,

      prefixIcon: Icon(icon),

      filled: true,

      fillColor: theme.colorScheme.surfaceContainerLowest,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: 1.4,
        ),
      ),
    );
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: theme.colorScheme.surface,

                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Container(
                    width: 50,
                    height: 5,

                    decoration: BoxDecoration(
                      color: theme.colorScheme.outline.withValues(
                        alpha: .2,
                      ),

                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),

                  const Gap(22),

                  Text(
                    'Edit Profile',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),

                  const Gap(24),

                  TextField(
                    controller: fullNameController,

                    decoration: inputDecoration(
                      'Full Name',
                      Icons.person_outline_rounded,
                    ),
                  ),

                  const Gap(16),

                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,

                    decoration: inputDecoration(
                      'Phone Number',
                      Icons.phone_outlined,
                    ),
                  ),

                  const Gap(16),

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    decoration: BoxDecoration(
                      color:
                          theme.colorScheme.surfaceContainerLowest,

                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedGender,

                        isExpanded: true,

                        borderRadius: BorderRadius.circular(20),

                        dropdownColor:
                            theme.colorScheme.surface,

                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: theme.colorScheme.primary,
                        ),

                        items: [
                          DropdownMenuItem(
                            value: 'Male',

                            child: Row(
                              children: [
                                Icon(
                                  Icons.male_rounded,
                                  color:
                                      theme.colorScheme.primary,
                                ),

                                const Gap(10),

                                const Text('Male'),
                              ],
                            ),
                          ),

                          DropdownMenuItem(
                            value: 'Female',

                            child: Row(
                              children: [
                                Icon(
                                  Icons.female_rounded,
                                  color:
                                      theme.colorScheme.primary,
                                ),

                                const Gap(10),

                                const Text('Female'),
                              ],
                            ),
                          ),
                        ],

                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedGender = value;
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  const Gap(16),

                  InkWell(
                    borderRadius: BorderRadius.circular(18),

                    onTap: () async {
                      final pickedDate =
                          await showDatePicker(
                        context: context,
                        initialDate:
                            selectedDate ??
                            DateTime(2000),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },

                    child: Container(
                      width: double.infinity,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),

                      decoration: BoxDecoration(
                        color: theme
                            .colorScheme
                            .surfaceContainerLowest,

                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: theme.colorScheme.primary,
                          ),

                          const Gap(12),

                          Expanded(
                            child: Text(
                              selectedDate != null
                                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                  : 'Date of Birth',

                              style: TextStyle(
                                color:
                                    theme.colorScheme.onSurface,

                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Gap(28),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        cubit.updateUserMethod(
                          fullName:
                              fullNameController.text.trim(),

                          phone:
                              phoneController.text.trim(),

                          gender:
                              selectedGender.toLowerCase(),

                          dateOfBirth: selectedDate,
                        );

                        Navigator.pop(context);
                      },

                      child: const Text(
                        'Save Changes',
                      ),
                    ),
                  ),

                  const Gap(14),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}