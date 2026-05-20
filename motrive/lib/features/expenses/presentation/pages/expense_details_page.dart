import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';

class ExpenseDetailsPage extends StatelessWidget {
  final AddExpenseEntity expense;

  const ExpenseDetailsPage({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expense_details'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: Text('category'.tr()),
              subtitle: Text(expense.category),
            ),

            ListTile(
              title:  Text('cost'.tr()),
              subtitle: Text('${expense.cost} SAR'),
            ),

            ListTile(
              title: Text('km'.tr()),

              subtitle: Text('${expense.odometer}'),
            ),

            ListTile(
              title: Text('notes'.tr()),
              subtitle: Text(expense.notes ?? '-'),
            ),
          ],
        ),
      ),
    );
  }
}
