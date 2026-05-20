
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:motrive/features/expenses/presentation/widgets/build_bar_chart_widget.dart';

class ExpenseStatisticsPage extends StatelessWidget {
  final ExpenseStatsEntity stats;
  final String selectedCategory;

  const ExpenseStatisticsPage({
    super.key,
    required this.stats,
    required this.selectedCategory,
  });
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        if (state is ExpensesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExpensesSuccessState) {
          double displayTotal = _calculateDisplayTotal(state);

          return RefreshIndicator(
            onRefresh: () => context.read<ExpensesCubit>().getExpensesMethod(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(), 
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTotalCard(displayTotal),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: state.selectedCategory, 
                          items: const [
                            DropdownMenuItem(value: 'All', child: Text('All')),
                            DropdownMenuItem(value: 'Fuel', child: Text('Fuel')),
                            DropdownMenuItem(value: 'Maintenance', child: Text('Maintenance')),
                            DropdownMenuItem(value: 'Oil', child: Text('Oil')),
                            DropdownMenuItem(value: 'Insurance', child: Text('Insurance')),
                            DropdownMenuItem(value: 'Violation', child: Text('Violation')),
                          ],//'Traffic violation' ,Vehicle insurance
                          onChanged: (val) {
                            if (val != null) {
                              context.read<ExpensesCubit>().filterByCategory(val);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  buildBarChart(state.stats),
                ],
              ),
            ),
          );
        } else if (state is ExpensesErrorState) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }

  double _calculateDisplayTotal(ExpensesSuccessState state) {
    switch (state.selectedCategory) {
      case 'Fuel': return state.stats.fuelTotal;
      case 'Maintenance': return state.stats.maintenanceTotal;
      case 'Vehicle insurance': return state.stats.insuranceTotal;
      case 'Oil': return state.stats.oilTotal;
      case 'Traffic violation': return state.stats.violationTotal;
      default: return state.stats.yearlyTotal;
    }
  }
  Widget _buildTotalCard(double total) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.secondary
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total Expenses',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${total.toStringAsFixed(2)} SAR', 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
}

