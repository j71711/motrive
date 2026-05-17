import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';

class ExpenseStatisticsPage extends StatelessWidget {
  final ExpenseStatsEntity stats;

  const ExpenseStatisticsPage({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('Monthly Total'),
              subtitle: Text('${stats.monthlyTotal} SAR'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: stats.fuelTotal,
                    title: 'Fuel',
                  ),
                  PieChartSectionData(
                    value: stats.maintenanceTotal,
                    title: 'Maintenance',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}