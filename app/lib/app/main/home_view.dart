import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/app/eras/eras_view.dart';
import 'package:buhoor/app/genres/genres_view.dart';
import 'package:buhoor/app/main/home_view_model.dart';
import 'package:buhoor/app/meters/meters_view.dart';
import 'package:buhoor/app/poem/poem_view.dart';
import 'package:buhoor/app/poem/poem_view_model.dart';
import 'package:buhoor/app/poets/poet_view.dart';
import 'package:buhoor/app/poets/poet_view_model.dart';
import 'package:buhoor/app/poets/poets_view.dart';
import 'package:buhoor/app/poets/poets_view_model.dart';
import 'package:buhoor/app/search/search_view.dart';
import 'package:buhoor/app/search/search_view_model.dart';
import 'package:buhoor/app/settings/settings_widget.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  HomeView({super.key});

  final _vm = Get.find<HomeViewModel>();
  final _searchVm = Get.find<SearchViewModel>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      drawer: SettingsWidget(),
      body: Obx(() =>
        Column(
          children: [
            AppBarWidget(drawerKey: _key),
            SizedBox(height: size.height * 0.02,),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (Get.find<PoetsViewModel>().page.value == 1) {
                            final poets = await MyApi.getPoetsByPage(1);
                            Get.find<PoetsViewModel>().poets.assignAll(poets);
                          }
                          Get.to(() => PoetsView());
                        },
                        child: Text(
                          'الشعراء',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => ErasView()),
                        child: Text(
                          'العصور',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => MetersView()),
                        child: Text(
                          'البحور',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => GenresView()),
                        child: Text(
                          'الأغراض',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04,),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    height: size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            if (_searchVm.word.isNotEmpty) {
                              _searchVm.searchEnded.value = false;
                              Get.to(() => SearchView());
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color:theme.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          color: theme.scaffoldBackgroundColor,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            color: theme.colorScheme.secondary,
                            width: 2,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            onChanged: (val) => _searchVm.word.value = val.trim(),
                            onSubmitted: (val) {
                              if (_searchVm.word.isNotEmpty) {
                                _searchVm.searchEnded.value = false;
                                Get.to(() => SearchView());
                              }
                            },
                            style: theme.textTheme.titleMedium,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height  * 0.01,),
                  Text(
                    'ابحث عن شعر، أو عن شاعر، أو عن عصر..',
                    style: theme.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.04,),
                  GestureDetector(
                    onTap: () {
                      Get.find<PoemViewModel>().poem.value = _vm.randomPoem.value;
                      Get.to(() => PoemView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: MyConstants.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: theme.primaryColor == Colors.white ?
                            MyConstants.lightGrey :
                            MyConstants.darkGrey,
                      ),
                      height: size.height * 0.12,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _vm.randomPoem.value.title,
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  _vm.randomPoem.value.poet,
                                  style: theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height  * 0.01),
                  Text(
                    'قصيدة عشوائية',
                    style: theme.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.04,),
                  GestureDetector(
                    onTap: () async {
                      final poetViewModel = Get.find<PoetViewModel>();
                      final data = await MyApi.getFilteredPoems(
                          poet: poetViewModel.poet.value.slug,
                      );
                      poetViewModel.poet.value = _vm.randomPoet.value;
                      poetViewModel.poems.value = data['poems'];
                      poetViewModel.totalPages.value = data['totalPages'];
                      Get.to(() => PoetView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: MyConstants.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: theme.primaryColor == Colors.white ?
                        MyConstants.lightGrey :
                        MyConstants.darkGrey,
                      ),
                      height: size.height * 0.12,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _vm.randomPoet.value.name,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    _vm.randomPoet.value.era,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Text(
                    'من شعراء العرب',
                    style: theme.textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}