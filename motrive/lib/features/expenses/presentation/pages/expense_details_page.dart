import 'package:flutter/material.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';

class ExpenseDetailsPage extends StatelessWidget {
  final AddExpenseEntity expense;

  const ExpenseDetailsPage({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: const Text('Category'),
              subtitle: Text(expense.category),
            ),

            ListTile(
              title: const Text('Cost'),
              subtitle: Text(
                '${expense.cost} SAR',
              ),
            ),

            ListTile(
              title: const Text('KM'),
              subtitle: Text(
                '${expense.odometer}',
              ),
            ),

            ListTile(
              title: const Text('Notes'),
              subtitle: Text(
                expense.notes ?? '-',
              ),
            ),
          ],
        ),
      ),
    );
  }
}