import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimelineWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget? Function(BuildContext, int)? oppositeContentsBuilder;
  final Widget? Function(BuildContext, int)? indicatorBuilder;
  final bool? Function(int index) dashedOrSolid;
  final Widget? Function(BuildContext, int)? contentsBuilder;
  final Widget? indicatorIcon;
  final int itemCount;

  const TimelineWidget({
    super.key,
    required this.onRefresh,
    this.oppositeContentsBuilder,
    required this.dashedOrSolid,
    this.indicatorBuilder,
    this.indicatorIcon,
    required this.itemCount,
    this.contentsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      displacement: 10.sh,
      child: Timeline.tileBuilder(
        padding: .all(8),
        builder: TimelineTileBuilder.connected(
          firstConnectorBuilder: (context) => DashedLineConnector(
            thickness: 3,
            gap: 5,
            space: 5,
            color: Theme.of(context).colorScheme.primary,
          ),
          oppositeContentsBuilder: oppositeContentsBuilder,
          connectorBuilder: (context, index, type) =>
              dashedOrSolid(index) ?? true
              ? SolidLineConnector(
                  thickness: 3,
                  color: Theme.of(context).colorScheme.primary,
                )
              : DashedLineConnector(
                  thickness: 3,
                  gap: 5,
                  space: 5,
                  color: Theme.of(context).colorScheme.primary,
                ),
          indicatorBuilder:
              indicatorBuilder ??
              (context, index) => Container(
                margin: .all(5),
                decoration: BoxDecoration(shape: .circle),
                child: indicatorIcon ?? Icon(Icons.car_repair_outlined),
              ),
          itemCount: itemCount,
          contentsAlign: ContentsAlign.basic,
          nodePositionBuilder: (context, index) => 0.2,
          contentsBuilder: contentsBuilder,
        ),
      ),
    );
  }
}
