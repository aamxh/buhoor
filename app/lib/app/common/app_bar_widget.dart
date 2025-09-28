import 'package:buhoor/app/eras/era_view_model.dart';
import 'package:buhoor/app/genres/genre_view_model.dart';
import 'package:buhoor/app/meters/meter_view_model.dart';
import 'package:buhoor/core/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {

  AppBarWidget({super.key, this.drawerKey});

  final GlobalKey<ScaffoldState>? drawerKey;
  final _vm = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              drawerKey != null ? Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02, right: 10),
                child: IconButton(
                  onPressed: () => drawerKey!.currentState!.openDrawer(),
                  icon: Icon(
                    Icons.view_headline_outlined,
                    size: 30,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ) : Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30),
                  color: theme.colorScheme.secondary,
                  onPressed: () {
                    Get.find<EraViewModel>().page.value = 1;
                    Get.find<MeterViewModel>().page.value = 1;
                    Get.find<GenreViewModel>().page.value = 1;
                    Get.back();
                  },
                ),
              ),
              Image.asset(
                theme.primaryColor == Colors.white ?
                'assets/buhoor.png' :
                'assets/buhoor_dark.jpg',
                width: size.width * 0.2,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02, left: 10),
                child: IconButton(
                  onPressed: () {
                    if (drawerKey != null) _vm.switchTheme();
                  },
                  icon: Icon(
                    _vm.isDark.value ? Icons.sunny : Icons.nightlight_round,
                    size: 30,
                    color: drawerKey == null ? theme.primaryColor : theme.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}