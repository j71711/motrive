import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:motrive/core/widgets/timeline_widget.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';

class ExpenseHistoryPage extends StatelessWidget {
  final List<ExpensesEntity> expenses;

  const ExpenseHistoryPage({
    super.key,
    required this.expenses,
  });

/*
  @override
  Widget build(BuildContext context) {

    if (expenses.isEmpty) {
      return const Center(
        child: Text('No Expenses Found'),
      );
    }

    return BlocConsumer<
        ExpensesCubit,
        ExpensesState>(
      listener: (context, state) {

        if (state is AddExpenseErrorState) {

          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },

      builder: (context, state) {

        final isLoading =
            state is AddExpensesLoadingState;

        return Stack(
          children: [
            ListView.builder(

              padding: const EdgeInsets.all(16),

              itemCount: expenses.length,

              itemBuilder: (context, index) {

                final item = expenses[index];

                return Padding(
                  padding:
                      const EdgeInsets.only(
                    bottom: 20,
                  ),

                  child: Slidable(

                    endActionPane: ActionPane(

                      motion:
                          const StretchMotion(),

                      children: [

                        /// EDIT
                        SlidableAction(

                          backgroundColor:
                              Colors.blue,

                          onPressed: (_) {

                            context
                                .read<
                                    ExpensesCubit>()
                                .updateExpenseMethod(

                                  AddExpenseEntity(

                                    id: item.id,

                                    // vehicleId:
                                        // item.vehicleId,

                                    category:
                                        item.category,

                                    cost:
                                        item.cost ?? 0,

                                    odometer:
                                        item.odometer,

                                    notes:
                                        item.notes,
                                  ),
                                );
                          },

                          icon: Icons.edit,
                        ),

                        SlidableAction(
                          backgroundColor:
                              Colors.red,
                          onPressed: (_) {
                            context
                                .read<
                                    ExpensesCubit>()
                                .deleteExpenseMethod(
                                  item.id,
                                  // item.vehicleId ?? ' ',
                                );
                          },
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 2,
                                height: 30,
                                color:
                                    Colors.grey,
                              ),

                              CircleAvatar(
                                radius: 22,

                                child: Icon(
                                  getExpenseIcon(
                                    item.category,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  width: 2,
                                  color:
                                      Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 16),

                          /// CARD
                          Expanded(
                            child: Container(

                              padding:
                                  const EdgeInsets
                                      .all(16),

                              decoration:
                                  BoxDecoration(

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  20,
                                ),

                                color: Colors.white,

                                boxShadow: [

                                  BoxShadow(
                                    blurRadius: 8,
                                    color: Colors
                                        .black12,
                                  ),
                                ],
                              ),

                              child: Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  /// HEADER
                                  Row(

                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,

                                    children: [

                                      Text(

                                        item.category,

                                        style:
                                            const TextStyle(
                                          fontSize:
                                              18,

                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),

                                      Text(
                                        DateFormat(
                                          'dd MMM yyyy',
                                        ).format(
                                          item.expenseDate!,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  Text(
                                    '${item.cost} SAR',
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  Text(
                                    '${item.odometer} KM',
                                  ),

                                  if (item.notes !=
                                          null &&
                                      item.notes!
                                          .isNotEmpty)

                                    Padding(

                                      padding:
                                          const EdgeInsets
                                              .only(
                                        top: 8,
                                      ),

                                      child: Text(
                                        item.notes!,
                                      ),
                                    ),

                                  const SizedBox(
                                    height: 12,
                                  ),

                                  /// DETAILS BUTTON
                                  Align(

                                    alignment:
                                        Alignment
                                            .centerRight,

                                    child:
                                        TextButton(

                                      onPressed: () {

                                        showExpenseDetailsBottomSheet(
                                          context,
                                          item,
                                        );
                                      },

                                      child:
                                          const Text(
                                        'Details',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            if (isLoading)

              Container(

                color: Colors.black26,

                child: const Center(
                  child:
                      CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }*/





  @override
  Widget build(BuildContext context) {

    if (expenses.isEmpty) {

      return const Center(
        child: Text('No Expenses Found'),
      );
    }

    return BlocConsumer<
        ExpensesCubit,
        ExpensesState>(

      listener: (context, state) {

        if (state is AddExpenseErrorState) {

          ScaffoldMessenger.of(context)
              .showSnackBar(

            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },

      builder: (context, state) {

        final isLoading =
            state is AddExpensesLoadingState;

        return Stack(

          children: [

            TimelineWidget(

              /// REFRESH
              onRefresh: () async {

                await context
                    .read<ExpensesCubit>()
                    .getExpensesMethod(
                      '9ebf96bd-fc6a-42c6-9a42-f9bebfa59b1c',
                    );
              },

              itemCount: expenses.length,

              /// SOLID OR DASHED
              dashedOrSolid: (index) {

                return index.isEven;
              },

              /// INDICATOR
              indicatorBuilder:
                  (context, index) {

                final item = expenses[index];

                return CircleAvatar(

                  radius: 18,

                  child: Icon(
                    getExpenseIcon(
                      item.category,
                    ),
                  ),
                );
              },

              /// DATE
              oppositeContentsBuilder:
                  (context, index) {

                final item = expenses[index];

                return Padding(

                  padding:
                      const EdgeInsets.only(
                    top: 16,
                  ),

                  child: Text(

                    DateFormat(
                      'dd MMM',
                    ).format(
                      item.expenseDate!,
                    ),
                  ),
                );
              },

              /// CARD
              contentsBuilder:
                  (context, index) {

                final item = expenses[index];

                return Padding(

                  padding:
                      const EdgeInsets.only(
                    bottom: 20,
                  ),

                  child: Slidable(

                    endActionPane: ActionPane(

                      motion:
                          const StretchMotion(),

                      children: [

                        /// EDIT
                        SlidableAction(

                          backgroundColor:
                              Colors.blue,

                          onPressed: (_) {

                            showEditExpenseBottomSheet(
                              context,
                              item,
                            );
                          },

                          icon: Icons.edit,
                        ),

                        /// DELETE
                        SlidableAction(

                          backgroundColor:
                              Colors.red,

                          onPressed: (_) {

                            showDeleteDialog(
                              context,
                              item.id,
                            );
                          },

                          icon: Icons.delete,
                        ),
                      ],
                    ),

                    child: Container(

                      padding:
                          const EdgeInsets.all(
                        16,
                      ),

                      decoration: BoxDecoration(

                        borderRadius:
                            BorderRadius.circular(
                          20,
                        ),

                        color: Colors.white,

                        boxShadow: [

                          BoxShadow(
                            blurRadius: 8,
                            color:
                                Colors.black12,
                          ),
                        ],
                      ),

                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          /// CATEGORY
                          Text(

                            item.category,

                            style:
                                const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          /// COST
                          Text(
                            '${item.cost} SAR',
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          /// KM
                          Text(
                            '${item.odometer} KM',
                          ),

                          /// NOTES
                          if (item.notes !=
                                  null &&
                              item.notes!
                                  .isNotEmpty)

                            Padding(

                              padding:
                                  const EdgeInsets
                                      .only(
                                top: 8,
                              ),

                              child: Text(
                                item.notes!,
                              ),
                            ),

                          const SizedBox(
                            height: 12,
                          ),

                          /// DETAILS
                          Align(

                            alignment:
                                Alignment
                                    .centerRight,

                            child: TextButton(

                              onPressed: () {

                                showExpenseDetailsBottomSheet(
                                  context,
                                  item,
                                );
                              },

                              child:
                                  const Text(
                                'Details',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            /// LOADING
            if (isLoading)

              Container(

                color: Colors.black26,

                child: const Center(
                  child:
                      CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }



  BarChartGroupData barItem(
    int x,
    double value,
  ) {
    return BarChartGroupData(
      x: x,

      barRods: [

        BarChartRodData(
          toY: value,
          width: 18,
        ),
      ],
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

  BarChartGroupData barItem(
    int x,
    double value,
  ) {
    return BarChartGroupData(

      x: x,

      barRods: [

        BarChartRodData(
          toY: value,
          width: 18,
          borderRadius:
              BorderRadius.circular(6),
        ),
      ],
    );
  }

void showDeleteDialog(
  BuildContext context,
  String expenseId,
) {
  showDialog(
    context: context,

    builder: (_) {
      return AlertDialog(
        title: const Text(
          'Delete Expense',
        ),

        content: const Text(
          'Are you sure?',
        ),

        actions: [

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },

            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () async {
              await context
                  .read<ExpensesCubit>()
                  .deleteExpenseMethod(
                    expenseId,
                  );

              Navigator.pop(context);
            },

            child: const Text(
              'Delete',
            ),
          ),
        ],
      );
    },
  );
}




void showEditExpenseBottomSheet(
  BuildContext context,
  ExpensesEntity item,
) {
  final amountController =
      TextEditingController(
    text: item.cost.toString(),
  );

  final kmController =
      TextEditingController(
    text: item.odometer.toString(),
  );

  final notesController =
      TextEditingController(
    text: item.notes,
  );

  String category = item.category;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom:
                  MediaQuery.of(context)
                      .viewInsets
                      .bottom,
              left: 20,
              right: 20,
              top: 20,
            ),

            child: Column(
              mainAxisSize:
                  MainAxisSize.min,

              children: [

                DropdownButtonFormField(
                  initialValue: category,

                  items: [
                    'Fuel',
                    'Vehicle insurance',
                    'Maintenance',
                    'Oil',
                    'Traffic violation',
                    'Other',
                  ].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),

                  onChanged: (val) {
                    setState(() {
                      category = val!;
                    });
                  },
                ),

                TextField(
                  controller: amountController,
                  decoration:
                      const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),

                TextField(
                  controller: kmController,

                  decoration:
                      const InputDecoration(
                    labelText: 'KM',
                  ),
                ),

                TextField(
                  controller:
                      notesController,

                  decoration:
                      const InputDecoration(
                    labelText: 'Notes',
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () async {
                      final entity =
                          AddExpenseEntity(
                        id: item.id,
                        vehicleId: '',
                        category: category,
                        cost: double.parse(
                          amountController.text,
                        ),
                        odometer: int.parse(
                          kmController.text,
                        ),
                        notes:
                            notesController.text,
                      );

                      await context
                          .read<ExpensesCubit>()
                          .updateExpenseMethod(
                            entity,
                          );

                      Navigator.pop(context);
                    },

                    child: const Text(
                      'Update',
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
      );
    },
  );
}




void showExpenseDetailsBottomSheet(
  BuildContext context,
  ExpensesEntity expense,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) {

      return Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),

        child: SafeArea(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                expense.category,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              ListTile(
                leading:
                    const Icon(Icons.payments),
                title: const Text('Amount'),
                trailing: Text(
                  '${expense.cost} SAR',
                ),
              ),

              ListTile(
                leading: const Icon(Icons.speed),
                title: const Text('Odometer'),
                trailing: Text(
                  '${expense.odometer} KM',
                ),
              ),

              ListTile(

                leading: const Icon(Icons.calendar_month),
                title: const Text('Date'),
                trailing: Text(
                  DateFormat(
                    'dd MMM yyyy',
                  ).format(
                    expense.expenseDate!,
                  ),
                ),
              ),

              if (expense.notes != null &&
                  expense.notes!.isNotEmpty)

                ListTile(
                  leading: const Icon(Icons.notes),
                  title: const Text('Notes'),
                  subtitle: Text(expense.notes!),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}


IconData getExpenseIcon(String category) {
  switch (category) {
    case 'Fuel':
      return Icons.local_gas_station;

    case 'Vehicle insurance':
      return Icons.security;

    case 'Maintenance':
      return Icons.build;

    case 'Oil':
      return Icons.opacity;

    case 'Traffic violation':
      return Icons.warning_amber;

    case 'Other':
      return Icons.category;

    default:
      return Icons.receipt_long;
  }
}

