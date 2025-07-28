import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {

  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(),
          ),
        ],
      ),
    );
  }

}