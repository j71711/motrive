import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';

class ExpensesFeatureScreen extends StatelessWidget {
  const ExpensesFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
      final _ = context.read<ExpensesCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses Feature Screen')),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
