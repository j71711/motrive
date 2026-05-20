import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/pages/chat_bot_feature_widget.dart';

class NavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: navigationShell.currentIndex == 3
          ? null
          : FloatingActionButton(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const CircleBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChatBotFeatureWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 26,
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (value) => navigationShell.goBranch(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'nav_home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair),
            label: 'nav_maintenance'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'nav_expense'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'nav_location'.tr(),
          ),
        ],
      ),
      body: navigationShell,
    );
  }
}
