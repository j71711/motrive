import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';

class ExpenseLoadingWidget extends StatelessWidget {
  const ExpenseLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        switch (state) {
          case ExpensesLoadingState _:
            return const Center(child: CircularProgressIndicator());
          case ExpensesSuccessState _:
            return ListView.builder(
              itemCount: state.expenses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text('loading'.tr()),
                    subtitle: Text('loading'.tr()),
                  ),
                );
              },
            );
          default:
            return  Text(  'something_went_wrong'.tr());
        }
      },
    );
  }
}
