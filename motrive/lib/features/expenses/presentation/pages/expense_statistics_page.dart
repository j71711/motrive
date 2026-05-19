import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';

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
            onRefresh: () => context.read<ExpensesCubit>().getExpensesMethod('9ebf96bd-fc6a-42c6-9a42-f9bebfa59b1c'),
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
                          initialValue: state.selectedCategory, 
                          items: const [

                            DropdownMenuItem(value: 'All', child: Text('All')),
                            DropdownMenuItem(value: 'Fuel', child: Text('Fuel')),
                            DropdownMenuItem(value: 'Maintenance', child: Text('Maintenance')),
                            DropdownMenuItem(value: 'Oil', child: Text('Oil')),
                            DropdownMenuItem(value: 'Insurance', child: Text('Insurance')),
                            DropdownMenuItem(value: 'Violation', child: Text('Violation')),

                            // DropdownMenuItem(value: 'All', child: Text('All')),
                            // DropdownMenuItem(value: 'Fuel', child: Text('Fuel')),
                            // DropdownMenuItem(value: 'Maintenance', child: Text('Maintenance')),
                            // DropdownMenuItem(value: 'Oil', child: Text('Oil')),
                            // DropdownMenuItem(value: 'Insurance', child: Text('Insurance')),
                            // DropdownMenuItem(value: 'Violation', child: Text('Violation')),
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
                  _buildBarChart(state.stats),
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


// BarChartGroupData _generateGroup(int x, double y) {
//   return BarChartGroupData(
//     x: x,
//     barRods: [
//       BarChartRodData(
//         toY: y,
//         color: AppColors.secondary, 
//         width: 16,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
//       ),
//     ],
//   );
// }




Widget _buildBarChart(ExpenseStatsEntity stats) {
  return SizedBox(
    height: 350,
    child: BarChart(
      BarChartData(
        maxY: _getMaxY(stats), 
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40, 
              getTitlesWidget: (value, meta) {
                const style = TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold);
                switch (value.toInt()) {
                  case 0: return SideTitleWidget( meta: meta, child: const Text('Fuel', style: style));
                  case 1: return SideTitleWidget( meta: meta, child: const Text('Ins', style: style));
                  case 2: return SideTitleWidget( meta: meta, child: const Text('Main', style: style));
                  case 3: return SideTitleWidget( meta: meta, child: const Text('Oil', style: style));
                  case 4: return SideTitleWidget( meta: meta, child: const Text('Viol', style: style));
                  case 5: return SideTitleWidget( meta: meta, child: const Text('Other', style: style));
                  default: return const SizedBox();
                }
              },
            ),
          ),
        ),
        barGroups: [
          _makeGroupData(0, stats.fuelTotal),
          _makeGroupData(1, stats.insuranceTotal),
          _makeGroupData(2, stats.maintenanceTotal),
          _makeGroupData(3, stats.oilTotal),
          _makeGroupData(4, stats.violationTotal),
          _makeGroupData(5, stats.otherTotal),
        ],
      ),
    ),
  );
}


BarChartGroupData _makeGroupData(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: AppColors.secondary,
        width: 20, 
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
    ],
  );
}

// دالة لحساب أعلى قيمة ديناميكياً لضبط مقياس الرسم
double _getMaxY(ExpenseStatsEntity stats) {
  double maxVal = [
    stats.fuelTotal, stats.insuranceTotal, stats.maintenanceTotal,
    stats.oilTotal, stats.violationTotal, stats.otherTotal
  ].reduce((a, b) => a > b ? a : b);
  
  return maxVal == 0 ? 100 : maxVal + (maxVal * 0.2); // إضافة مساحة 20% فوق أطول عمود
}
