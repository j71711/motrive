import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_cubit.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_state.dart';

class AddExpenseFeatureWidget extends StatelessWidget {
  final ExpensesEntity? expense;
  const AddExpenseFeatureWidget({super.key, this.expense});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExpenseCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<AddExpenseCubit>();
          final formKey = GlobalKey<FormState>();
          if (expense != null) {
            cubit.costController.text = expense!.cost.toString();
            cubit.kmController.text = expense!.odometer.toString();
            cubit.selectedCategory = expense!.category;
          }
          return BlocListener<AddExpenseCubit, AddExpenseState>(
            listener: (context, state) {
              switch (state) {
                case AddExpenseSuccessState _:
                  context.showSnackBar('Saved successfully');
                  context.pop(true);
                case AddExpenseErrorState _:
                  context.showSnackBar(state.message);
              }
            },
            child: SingleChildScrollView(
              child: Form(
                key: formKey,

                child: Column(
                  spacing: 12,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Gap(20),
                    const Text(
                      'Add Expense',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Gap(24),

                    DropdownButtonFormField(
                      initialValue: cubit.selectedCategory,
                      decoration: const InputDecoration(labelText: 'Category'),
                      items:
                          [
                                'Fuel',
                                'Vehicle insurance',
                                'Maintenance',
                                'Oil',
                                'Traffic violation',
                                'Other',
                              ]
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                      onChanged: (val) => cubit.selectedCategory = val,
                      validator: Validators.validateRequired,
                    ),

                    TextFormField(
                      controller: cubit.costController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Cost'),
                      validator: Validators.validateRequired,
                    ),

                    BlocBuilder<AddExpenseCubit, AddExpenseState>(
                      builder: (context, state) {
                        final loaded =
                            state is AddExpenseSuccessState &&
                            state.vehicle != null;
                        return Column(
                          children: [
                            TextFormField(
                              controller: cubit.kmController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Odometer',
                              ),
                              validator: (value) => Validators.validateOdometer(
                                value,
                                loaded
                                    ? state.vehicle!.odometerAtRegistered ?? 0
                                    : 0,
                              ),
                            ),
                            Align(
                              alignment: .centerEnd,
                              child: Text(
                                'Last odometer: ${loaded ? Formatters.formatOdometer(state.vehicle!.currentOdometer ?? 0) : 0}',
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const Gap(30),

                    BlocBuilder<AddExpenseCubit, AddExpenseState>(
                      builder: (context, state) {
                        final isLoading = state is AddExpensesLoadingState;
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.addExpenseMethod();
                                    }
                                  },
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : const Text("save"),
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
