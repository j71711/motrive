import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';

class ExpenseLoadingWidget extends StatelessWidget {
  const ExpenseLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {

  return  BlocBuilder<ExpensesCubit, ExpensesState>(
  builder: (context, state){
    switch (state){
      case ExpensesLoadingState _:
      return const Center(child: CircularProgressIndicator());
      case ExpensesSuccessState _:
       return 
       ListView.builder(
        itemCount: state.expenses.length,
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Loading Loading'),
              subtitle: Text('Loading Loading'),
            ),
          );
        },
      );

      //  ListView.builder(
      //   itemCount: state.expenses.length,
      //   itemBuilder: (context, index) => ExpenseTile(state.expenses[index]));
        default: return const Text('Something went wrong');
        }}
    );
  }
}