import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:motrive/features/expenses/presentation/pages/expense_history_page.dart';
import 'package:motrive/features/expenses/presentation/pages/expense_statistics_page.dart';
import 'package:motrive/features/expenses/presentation/widgets/expense_loading_widget.dart';

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
            title: const Text('Expenses Feature Screen'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Statistics'),
                  Tab(text: 'Expenses'),
                ],
              ),
          ),
          body: BlocBuilder<ExpensesCubit, ExpensesState>(
            builder: (context, state){
      final cubit = context.read<ExpensesCubit>();
             switch(state){
              case ExpensesLoadingState _:
              return const ExpenseLoadingWidget();
              case ExpensesErrorState _:
              return Center(child: Text(state.message));
              case ExpensesSuccessState _: 
                  return RefreshIndicator(
                    onRefresh: () async {
                      await cubit.getExpensesMethod('vehicleId_here');
                    },
                    child: TabBarView(
                      children: [
                        ExpenseStatisticsPage(
                          stats: state.stats,
                          selectedCategory: state.selectedCategory,
                        ),
                            
                        Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                    
                        children: [
                    
                          SlidableAction(
                            onPressed: (_) {
                              // cubit.updateExpenseMethod();
                            },
                            icon: Icons.edit,
                          ),
                    
                          SlidableAction(
                            onPressed: (_) {
                              // cubit.deleteExpenseMethod();
                            },
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                    
                      child: 
                      ExpenseHistoryPage(expenses: state.expenses),
                    ),
                    
                        // ExpenseHistoryPage(
                        //   expenses: state.expenses,
                        // ),
                      ],
                    ),
                  );
                // default: const SizedBox();
            }
            return const SizedBox();
          }),),
      )
    );
  }
}
      