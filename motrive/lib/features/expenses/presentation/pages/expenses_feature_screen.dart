import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:motrive/features/expenses/presentation/pages/expense_history_page.dart';
import 'package:motrive/features/expenses/presentation/pages/expense_statistics_page.dart';
import 'package:motrive/features/expenses/presentation/widgets/expense_loading_widget.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/pages/add_expense_feature_widget.dart';

class ExpensesFeatureScreen extends StatelessWidget {
  const ExpensesFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesCubit(GetIt.I.get()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('my_expenses'.tr()),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async => context
                    .showBottomSheet(widget: AddExpenseFeatureWidget())
                    .then((value) {
                      if (value == true && context.mounted) {
                        context.read<ExpensesCubit>().getExpensesMethod();
                      }
                    }),
                icon: Icon(Icons.add_card_rounded),
              ),
            ],
            bottom: TabBar(
              dividerHeight: 0,
              tabs: [
               Tab(text: 'expenses'.tr()),
               Tab(text: 'statistics'.tr()),
              ],
            ),
          ),
          body: BlocBuilder<ExpensesCubit, ExpensesState>(
            builder: (context, state) {
              final cubit = context.read<ExpensesCubit>();
              switch (state) {
                case ExpensesLoadingState _:
                  return const ExpenseLoadingWidget();
                case ExpensesErrorState _:
                  return Center(child: Text(state.message));
                case ExpensesSuccessState _:
                  return RefreshIndicator(
                    onRefresh: () async {
                      await cubit.getExpensesMethod();
                    },
                    child: TabBarView(
                      children: [
                        ExpenseHistoryPage(expenses: state.expenses),
                        ExpenseStatisticsPage(
                          stats: state.stats,
                          selectedCategory: state.selectedCategory,
                        ),
                      ],
                    ),
                  );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
