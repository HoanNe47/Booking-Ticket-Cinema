import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/config/color/color.dart';
import 'package:movie_ticket/controller/home_controller.dart';
import 'package:movie_ticket/screen/movie/movie_screen.dart';
import 'package:movie_ticket/screen/my_ticket/my_ticket_screen.dart';
import 'package:movie_ticket/screen/setting/setting_screen.dart';
import 'package:movie_ticket/screen/location/location_screen.dart';
import 'package:movie_ticket/screen/movie/new_home_screen.dart'; 

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (_homeController.selectedIndex.value) {
          case 0:
            return const MovieScreen();
          case 1:
            return const NewHomeScreen();
          case 2:
            return const MyTicketScreen();
          case 3:
            return SettingScreen();
          case 4: // Case cho page mới
            return const LocationPage();
          default:
            return const MovieScreen();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: 'Movies'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.qr_code),
              label: 'myTicket'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'setting'.tr,
            ),
            BottomNavigationBarItem( // Thêm icon cho page mới
              icon: const Icon(Icons.location_on),
              label: 'Location'.tr,
            ),
          ],
          currentIndex: _homeController.selectedIndex.value,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.grey,
          onTap: (index) {
            _homeController.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
