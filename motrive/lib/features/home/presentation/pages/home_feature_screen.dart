import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_cubit.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/cubit/add_car_card_state.dart';
import 'package:motrive/features/home/sub/add_car_card/presentation/pages/add_car_card_feature_widget.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/pages/chat_bot_feature_widget.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_feature_widget.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/sub/maintenance_alert/presentation/pages/maintenance_alert_feature_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocProvider(
      create: (_) =>
          EmergencyContactCubit(GetIt.I.get())..getEmergencyContactMethod(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
          leading: IconButton.filled(
            onPressed: () => context.push(Routes.profile),
            icon: Icon(Icons.person),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: BlocProvider(
                create: (_) => AddCarCardCubit(GetIt.I.get()),
                child: BlocBuilder<AddCarCardCubit, AddCarCardState>(
                  builder: (context, state) {
                    if (state is AddCarCardErrorState) {
                      return Text("error: ${state.message}");
                    }
                    if (state is VehiclesLoadingState ||
                        state is CarsInfoLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    if (state is AddCarCardLoadedState ||
                        state is CarInfoLoadedState) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final screenSize = MediaQuery.of(context).size;
                              return Center(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  margin: const EdgeInsets.all(20),
                                  child: Container(
                                    margin: const EdgeInsets.all(16),
                                    width: screenSize.width * 0.85,
                                    height: screenSize.height * 0.60,
                                    padding: const EdgeInsets.all(16),
                                    child: const AddCarCardFeatureWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: state.vehicles.isNotEmpty
                            ? Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${state.vehicles.first.make} ${state.vehicles.first.model}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          state.vehicles.first.year.toString(),
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        border: BoxBorder.all(),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Text(
                                        '${state.vehicles.first.currentOdometer ?? 0} Km',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.all(16),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(),
                                ),
                                child: const Text("Add your first car"),
                              ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            SosFeatureWidget(),
            MaintenanceAlertFeatureWidget(),
            InkWell(
              child: GridView.count(
                shrinkWrap: true, // مهم للسماح للـ Grid بالتواجد داخل ScrollView
                crossAxisCount: 2, // عدد الأعمدة
                crossAxisSpacing: 12, // المسافة الأفقية
                mainAxisSpacing: 12, // المسافة الرأسية
                childAspectRatio: 2.5, // للتحكم في عرض وطول البطاقة لتشبه الصورة
                children: [
                  buildMenuItem
                  (Icons.build, 'Maintenance'),
                  buildMenuItem
                  (Icons.location_on, 'save location'),
                  buildMenuItem
                  (Icons.notifications, 'notification'),
                  buildMenuItem
                  (Icons.settings, 'Add Expense'),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatBotFeatureWidget(),
                  ),
                );
              },
              child: Icon(Icons.message_outlined, size: 40,),
            ),
              Gap(16),
          ],
        ),
        
      ),
    );
  }
  Widget buildMenuItem(IconData icon, String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(),
      // color: AppColors.background, // لون خلفية البطاقة
      borderRadius: BorderRadius.circular(15), // زوايا منحنية
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // دائرة خلفية للأيقونة
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Color(0xFF4A148C), // لون الأيقونة (نفس البنفسجي في الصورة)
            size: 20,
          ),
        ),
        SizedBox(width: 12), // مسافة بين الأيقونة والنص
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
}
