import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/core/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'poem_view_model.dart';

class PoemView extends StatelessWidget {

  PoemView({super.key});

  final _vm = Get.find<PoemViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              children: [
                SizedBox(height: size.height * 0.04,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _vm.poem.value.title,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _vm.poem.value.poet,
                      style: theme.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '|',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      _vm.poem.value.meter,
                      style: theme.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '|',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      _vm.poem.value.genre,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.06,),
                Text(
                  MyHelpers.formatPoem(_vm.poem.value.content),
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.06,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}