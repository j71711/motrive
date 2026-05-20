
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';

Widget buildBarChart(ExpenseStatsEntity stats) {
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
                  case 0: return SideTitleWidget( meta: meta, child: Text('fuel'.tr(), style: style));
                  case 1: return SideTitleWidget( meta: meta, child: Text('insurance'.tr(), style: style));
                  case 2: return SideTitleWidget( meta: meta, child: Text('maintenance'.tr(), style: style));
                  case 3: return SideTitleWidget( meta: meta, child:Text('oil'.tr(), style: style));
                  case 4: return SideTitleWidget( meta: meta, child:Text('violation'.tr(), style: style));
                  case 5: return SideTitleWidget( meta: meta, child: Text('other'.tr(), style: style));
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
double _getMaxY(ExpenseStatsEntity stats) {
  double maxVal = [
    stats.fuelTotal, stats.insuranceTotal, stats.maintenanceTotal,
    stats.oilTotal, stats.violationTotal, stats.otherTotal
  ].reduce((a, b) => a > b ? a : b);
  return maxVal == 0 ? 100 : maxVal + (maxVal * 0.2); 
}