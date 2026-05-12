import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/utils/formatters.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_cubit.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_state.dart';

class MaintenanceDetailsFeatureScreen extends StatelessWidget {
  final ServiceInfoEntity serviceInfo;
  const MaintenanceDetailsFeatureScreen({super.key, required this.serviceInfo});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MaintenanceDetailsCubit>();
    cubit.getMaintenanceDetailsMethod(serviceInfo.id);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: .symmetric(horizontal: 8),
        actions: [IconButton.filled(onPressed: () {}, icon: Icon(Icons.done))],
      ),
      body: BlocListener<MaintenanceDetailsCubit, MaintenanceDetailsState>(
        listener: (context, state) {
          if (state is MaintenanceDetailsErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              children: [
                Card(
                  clipBehavior: .antiAlias,
                  child: Padding(
                    padding: const .all(8.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Service Odometer: ${Formatters.formatOdometer(serviceInfo.serviceOdometer)}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Container(
                              padding: .symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: .circular(16),
                                color: serviceInfo.severity == 'critical'
                                    ? Colors.orangeAccent
                                    : Colors.green,
                              ),
                              child: Text(
                                serviceInfo.severity,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Date Interval: ${serviceInfo.dateIntervalMonths} months',
                          softWrap: true,
                        ),
                        Gap(10),
                        if (serviceInfo.recommendation != 'no data')
                          Column(
                            spacing: 5,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                'Recommendations:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(serviceInfo.recommendation, softWrap: true),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: .centerEnd,
                  child: Text(
                    'Last odometer: ${Formatters.formatOdometer(15125)}',
                  ),
                ),
                BlocBuilder<MaintenanceDetailsCubit, MaintenanceDetailsState>(
                  builder: (context, state) {
                    return switch (state) {
                      MaintenanceDetailsErrorState _ => Center(
                        child: Text('No services available'),
                      ),
                      MaintenanceDetailsSuccessState _ =>
                        state.maintenanceDetails.parts.isEmpty
                            ? Center(child: Text('No services available'))
                            : Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      spacing: 5,
                                      mainAxisAlignment: .end,
                                      children: [
                                        Text('Select all'),
                                        Checkbox(
                                          value: state.selectedAll ?? false,
                                          onChanged: (value) => cubit.selectAll(
                                            state.maintenanceDetails,
                                            value ?? false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          final part = state
                                              .maintenanceDetails
                                              .parts[index];
                                          return Card(
                                            child: CheckboxListTile(
                                              onChanged: (value) =>
                                                  cubit.togglePart(
                                                    state.maintenanceDetails,
                                                    index,
                                                    value ?? false,
                                                  ),
                                              value: part.done,
                                              title: Row(
                                                mainAxisSize: .min,
                                                spacing: 10,
                                                children: [
                                                  Container(
                                                    padding: .symmetric(
                                                      horizontal: 8,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: .circular(
                                                        16,
                                                      ),
                                                      color:
                                                          part.action ==
                                                              'replace'
                                                          ? Colors.orangeAccent
                                                          : Colors.green,
                                                    ),
                                                    child: Text(
                                                      part.action,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(part.partName),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Column(
                                                spacing: 5,
                                                mainAxisSize: .min,
                                                crossAxisAlignment: .start,
                                                children: [
                                                  if (part.specification !=
                                                      'no data')
                                                    Text(part.specification),
                                                  if (part.quantity != 0)
                                                    Row(
                                                      spacing: 10,
                                                      mainAxisAlignment:
                                                          .spaceBetween,
                                                      mainAxisSize: .min,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Qty: ${part.quantity} ${part.quantityUnit}',
                                                          ),
                                                        ),
                                                        if (part.oemPartNumber !=
                                                            'no data')
                                                          Text(
                                                            'OEM No. ${part.oemPartNumber}',
                                                          ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                              checkboxShape: CircleBorder(),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              color: Colors.transparent,
                                              height: 5,
                                            ),
                                        itemCount: state
                                            .maintenanceDetails
                                            .parts
                                            .length,
                                      ),
                                    ),
                                    TextField(
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      decoration: InputDecoration(
                                        label: Text('Notes'),
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      _ => LoadingWidget(),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
