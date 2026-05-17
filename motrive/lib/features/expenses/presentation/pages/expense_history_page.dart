import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/presentation/pages/expenses_feature_screen.dart';

class ExpenseHistoryPage extends StatelessWidget {
  final ExpensesEntity expenses;

  const ExpenseHistoryPage({
    super.key,
    required this.expenses,
  });
/*
  @override
  Widget build(BuildContext context) {
    return 
    
    ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final item = expenses[index];
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// TIMELINE
              Column(
                children: [

                  /// line top
                  Container(
                    width: 2,
                    height: 30,
                    color: AppColors.textSecondary,
                  ),

                  /// dot
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),

                  /// line bottom
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const Gap(16),

              /// CONTENT
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        BorderRadius.circular(16),
                  ),

                  child: Column(
                    crossAxisAlignment: .start,

                    children: [

                      Text(
                        item.category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Gap(8),

                      Text(
                        '${item.cost} SAR',
                      ),

                      const Gap(4),

                      Text(
                        '${item.odometer} KM',
                      ),

                      const Gap(4),

                      Text(DateFormat('dd MMM yyyy').format(item.expenseDate!))
                      
                      // Text(
                      //   item.expenseDate
                      //       .toString(),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          /// TIMELINE
          Column(
            children: [
              Container(
                width: 2,
                height: 30,
                color: Colors.grey.shade300,
              ),

              CircleAvatar(
                radius: 22,
                child: Icon(
                  getExpenseIcon(
                    expenses.category,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          /// CONTENT
          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        expenses.category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatDate(
                          expenses.expenseDate!,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${expenses.cost} SAR',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${expenses.odometer} KM',
                  ),

                  if (expenses.notes != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text(
                        expenses.notes!,
                      ),
                    ),

                  const SizedBox(height: 16),

                  /// ACTIONS
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,

                    children: [

                      /// delete
                      IconButton(
                        onPressed: () {
                          showDeleteDialog(
                            context,
                            expenses.id,
                          );
                        },

                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),

                      /// edit
                      IconButton(
                        onPressed: () {
                          showEditExpenseBottomSheet(
                            context,
                            expenses,
                          );
                        },

                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),

                      /// details
                      IconButton(
                        onPressed: () {
                          showExpenseDetailsBottomSheet(
                            context,
                            expenses,
                          );
                        },

                        icon: const Icon(
                          Icons.visibility,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Slidable(
  endActionPane: ActionPane(
    motion: const StretchMotion(),

    children: [

      SlidableAction(
        onPressed: (_) {},
        icon: Icons.edit,
      ),

      SlidableAction(
        onPressed: (_) {},
        icon: Icons.delete,
      ),
    ],
  ),

  child: ExpensesFeatureScreen(),
)
        ],
      ),
    );
  }
}