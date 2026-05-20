import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/extensions/string_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/timeline_widget.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:motrive/features/expenses/presentation/widgets/icons.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/pages/add_expense_feature_widget.dart';
import 'package:sizer/sizer.dart';

class ExpenseHistoryPage extends StatelessWidget {
  final List<ExpensesEntity> expenses;

  const ExpenseHistoryPage({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesCubit>();
    if (expenses.isEmpty) {
      return Center(child: Text('no_expenses_found'.tr()));
    }

    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is AddExpenseErrorState) {
          context.showSnackBar(state.message, isError: true);
        }
      },

      builder: (context, state) {
        return Stack(
          children: [
            TimelineWidget(
              onRefresh: () async {},
              itemCount: expenses.length,
              dashedOrSolid: (index) {
                return expenses.length - 1 != index;
              },
              indicatorBuilder: (context, index) {
                final item = expenses[index];
                return CircleAvatar(
                  radius: 18,
                  child: Icon(getExpenseIcon(item.category)),
                );
              },

              oppositeContentsBuilder: (context, index) {
                final item = expenses[index];
                return Center(
                  child: Text(DateFormat('dd MMM').format(item.expenseDate!)),
                );
              },

              contentsBuilder: (context, index) {
                final item = expenses[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          context
                              .showBottomSheet(
                                widget: AddExpenseFeatureWidget(expense: item),
                              )
                              .then((value) {
                                if (value == true) {
                                  cubit.getExpensesMethod();
                                }
                              });
                        },
                        icon: Icons.edit,
                      ),

                      SlidableAction(
                        backgroundColor: Colors.redAccent,
                        onPressed: (_) async {
                          showDeleteDialog(context, item.id).then((value) {
                            if (value == true) {
                              cubit.getExpensesMethod();
                            }
                          });
                        },
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          item.category.capitalizeWords,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: .bold,
                          ),
                        ),

                        Row(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text('${item.cost} ${'sar'.tr()}'),
                            FilledButton(
                              onPressed: () {
                                showExpenseDetailsBottomSheet(context, item);
                              },
                              style: ButtonStyle(
                                padding: .all(.symmetric(horizontal: 15)),
                                tapTargetSize: .shrinkWrap,
                              ),
                              child: Text('details'.tr()),
                            ),
                          ],
                        ),
                        Text(Formatters.formatOdometer(item.odometer)),

                        if (item.notes != null && item.notes!.isNotEmpty)
                          Padding(
                            padding: .only(top: 8),
                            child: Text(item.notes!),
                          ),
                        const Gap(10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  double getMaxY(dynamic stats) {
    final values = [
      stats.fuelTotal,
      stats.insuranceTotal,
      stats.maintenanceTotal,
      stats.oilTotal,
      stats.violationTotal,
      stats.otherTotal,
    ];
    values.sort();
    return values.last + 100;
  }
}

Future<T?> showDeleteDialog<T>(BuildContext context, String expenseId) async {
  return await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text('delete_expense'.tr()),
        content: Text('are_you_sure'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('cancel'.tr()),
          ),
          FilledButton(
            onPressed: () {
              context.pop(true);
            },
            child: Text('delete'.tr()),
          ),
        ],
      );
    },
  );
}

void showEditExpenseBottomSheet(BuildContext context, ExpensesEntity item) {
  /*  final amountController = TextEditingController(text: item.cost.toString());
  final kmController = TextEditingController(text: item.odometer.toString());
  final notesController = TextEditingController(text: item.notes);

  String category = item.category; */
  context.showBottomSheet(
    widget: AddExpenseFeatureWidget(expense: item),
    /* return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),

            child: Column(
              mainAxisSize: .min,
              children: [
                DropdownButtonFormField(
                  initialValue: category,
                  items:
                      [
                        'Fuel',
                        'Vehicle insurance',
                        'Maintenance',
                        'Oil',
                        'Traffic violation',
                        'Other',
                      ].map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                  onChanged: (val) {
                    setState(() {
                      category = val!;
                    });
                  },
                ),

                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),

                TextField(
                  controller: kmController,
                  decoration: const InputDecoration(labelText: 'KM'),
                ),

                TextField(
                  controller: notesController,
                  decoration: const InputDecoration(labelText: 'Notes'),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final entity = AddExpenseEntity(
                        id: item.id,
                        vehicleId: '',
                        category: category,
                        cost: double.parse(amountController.text),
                        odometer: int.parse(kmController.text),
                        notes: notesController.text,
                      );

                      await context.read<ExpensesCubit>().updateExpenseMethod(
                        entity,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Update'),
                  ),
                ),
                const Gap(30),
              ],
            ),
          );
        },
      ); */
  );
}

void showExpenseDetailsBottomSheet(
  BuildContext context,
  ExpensesEntity expense,
) {
  context.showBottomSheet(
    height: 45.sh,
    widget: SafeArea(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expense.category,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(24),
          ListTile(
            leading: const Icon(Icons.payments),
            title: Text('amount'.tr()),
            trailing: Text('${expense.cost} SAR'),
          ),

          ListTile(
            leading: const Icon(Icons.speed),
            title: Text('odometer'.tr()),
            trailing: Text('${expense.odometer} ${'km'.tr()}'),
          ),

          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: Text('date'.tr()),
            trailing: Text(
              DateFormat('dd MMM yyyy').format(expense.expenseDate!),
            ),
          ),

          if (expense.notes != null && expense.notes!.isNotEmpty)
            ListTile(
              leading: const Icon(Icons.notes),
              title: Text('notes'.tr()),
              subtitle: Text(expense.notes!),
            ),

          const Gap(20),
        ],
      ),
    ),
  );
}
