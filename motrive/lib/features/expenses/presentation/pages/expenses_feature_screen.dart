import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/widgets/error_button.dart';
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
    final cubit = context.read<ExpensesCubit>();
        final activeLoc = context.locale;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('my_expenses'.tr()),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => context
                  .showBottomSheet(widget: AddExpenseFeatureWidget())
                  .then((value) {
                    if (value == true) {
                      cubit.getExpensesMethod();
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
              case ExpenseLoadingWidget _:
                return const ExpenseLoadingWidget();
              case ExpensesErrorState _:
                return ErrorButton(
                  message: state.message,
                  refresh: () => cubit.getExpensesMethod(),
                );
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
    );
  }
}
