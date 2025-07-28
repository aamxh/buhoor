import 'package:buhoor/app/main/home_view_model.dart';
import 'package:buhoor/app/main/search_view.dart';
import 'package:buhoor/app/settings/settings_widget.dart';
import 'package:buhoor/core/constants.dart';
import 'package:buhoor/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  HomeView({super.key});

  final _vm = Get.find<HomeViewModel>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      drawer: SettingsWidget(),
      body: Column(
        children: [
          Container(
            color: MyConstants.primaryColor,
            height: size.height * 0.05,
          ),
          Container(
            color: MyConstants.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    GestureDetector(
                        onTap: () => _key.currentState!.openDrawer(),
                        child: Icon(
                          Icons.view_headline_outlined,
                          size: 30,
                          color: theme.scaffoldBackgroundColor,
                        ),
                      ),
                  ],
                ),
                Image.asset(
                  'assets/buhoor_no_bg.png',
                  width: size.width * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                      Icons.view_headline_outlined,
                      size: 30,
                      color: MyConstants.primaryColor,
                    ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'الشعراء',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: MyConstants.primaryColor
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'العصور',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: MyConstants.primaryColor
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'البحور',
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: MyConstants.primaryColor
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'الأغراض',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: MyConstants.primaryColor
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.08,),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                  ),
                  height: size.height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          if (_vm.searchWord.isNotEmpty) {
                            Get.to(() => SearchView());
                          }
                        },
                        child: Obx(() =>
                            Icon(
                              Icons.search,
                              size: 30,
                              color:
                              _vm.searchWord.isEmpty ?
                              theme.colorScheme.secondary :
                              theme.primaryColor,
                            ),
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
                          onChanged: (val) => _vm.searchWord.value = val,
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
                  'إبحث عن شعر، أو عن شاعر، أو عن عصر..',
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.04,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: size.height * 0.1,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            poems.first['title'].toString(),
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '- ${poems.first['poet']}',
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
                SizedBox(height: size.height  * 0.01),
                Text(
                  'قصيدة عشوائية',
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}