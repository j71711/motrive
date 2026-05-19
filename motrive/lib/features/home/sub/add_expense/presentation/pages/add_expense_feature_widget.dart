import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_cubit.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_state.dart';

class AddExpenseFeatureWidget extends StatelessWidget {
  const AddExpenseFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExpenseCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddExpenseCubit>();
          final formKey = GlobalKey<FormState>();

          final categories = [
            {
              'value': 'Fuel',
              'label': 'fuel',
            },
            {
              'value': 'Vehicle insurance',
              'label': 'vehicle_insurance',
            },
            {
              'value': 'Maintenance',
              'label': 'maintenance',
            },
            {
              'value': 'Oil',
              'label': 'oil',
            },
            {
              'value': 'Traffic violation',
              'label': 'traffic_violation',
            },
            {
              'value': 'Other',
              'label': 'other',
            },
          ];

          return Container(
            padding: const EdgeInsets.only(top: 16),

            child: SingleChildScrollView(
              child: Form(
                key: formKey,

                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      'add_expense'.tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Gap(24),

                    DropdownButtonFormField<String>(
                      initialValue: cubit.selectedCategory,

                      decoration: InputDecoration(
                        labelText: 'category'.tr(),
                      ),

                      items: categories
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e['value'],
                              child: Text(
                                e['label']!.tr(),
                              ),
                            ),
                          )
                          .toList(),

                      onChanged: (val) {
                        cubit.selectedCategory = val;
                      },

                      validator: (val) {
                        if (val == null) {
                          return 'required'.tr();
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: cubit.costController,
                      keyboardType: TextInputType.number,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],

                      decoration: InputDecoration(
                        labelText: 'cost'.tr(),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'required'.tr();
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: cubit.kmController,
                      keyboardType: TextInputType.number,

                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],

                      decoration: InputDecoration(
                        labelText: 'odometer'.tr(),
                      ),

                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'required'.tr();
                        }
                        return null;
                      },
                    ),

                    const Gap(30),

                    BlocConsumer<AddExpenseCubit, AddExpenseState>(
                      listener: (context, state) {
                        switch (state) {
                          case AddExpenseSuccessState _:
                            context.showSnackBar(
                              'saved_successfully'.tr(),
                            );

                          case AddExpenseErrorState _:
                            context.showSnackBar(state.message);

                          default:
                        }
                      },

                      builder: (context, state) {
                        final isLoading =
                            state is AddExpensesLoadingState;

                        return SizedBox(
                          width: double.infinity,
                          height: 50,

                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (formKey.currentState!
                                        .validate()) {
                                      cubit.addExpenseMethod();
                                    }
                                  },

                            child: isLoading
                                ? const CircularProgressIndicator()
                                : Text('save'.tr()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}