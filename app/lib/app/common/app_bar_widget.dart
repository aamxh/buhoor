import 'package:buhoor/core/constants.dart';
import 'package:buhoor/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {

  const AppBarWidget({super.key, this.drawerKey});

  final GlobalKey<ScaffoldState>? drawerKey;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  drawerKey != null ? Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
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
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
              Image.asset(
                theme.primaryColor == Colors.white ?
                'assets/buhoor.png' :
                'assets/buhoor_dark.png',
                width: size.width * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.view_headline_outlined,
                  size: 30,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}