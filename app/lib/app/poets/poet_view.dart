import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/app/poem/poem_view.dart';
import 'package:buhoor/app/poem/poem_view_model.dart';
import 'package:buhoor/app/poets/poet_view_model.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoetView extends StatelessWidget {

  PoetView({super.key});

  final _vm = Get.find<PoetViewModel>();

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
                    _vm.poet.value.name,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.01,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _vm.poet.value.era,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: size.height * 0.02,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _vm.poet.value.bio,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _vm.poems.length,
                  itemBuilder: (context, idx) => Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        Get.find<PoemViewModel>().poem.value = _vm.poems[idx];
                        Get.to(() => PoemView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyConstants.lightGrey,
                        ),
                        height: size.height * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _vm.poems[idx].title,
                              style: theme.textTheme.titleSmall,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _vm.poems[idx].meter,
                                  style: theme.textTheme.bodyLarge,
                                ),
                                Text(
                                  _vm.poems[idx].genre,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}