import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/app/poem/poem_view.dart';
import 'package:buhoor/app/poem/poem_view_model.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'genre_view_model.dart';

class GenreView extends StatelessWidget {

  GenreView({super.key});

  final _vm = Get.find<GenreViewModel>();

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
                    "الغرض: ${_vm.genreName.value}",
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                Obx(() =>
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
                                    _vm.poems[idx].poet,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    _vm.poems[idx].meter,
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
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          Obx(() =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _vm.page.value == 1 ? Container() : IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 20,),
                    onPressed: () async {
                      _vm.page.value = _vm.page.value - 1;
                      final data = await MyApi.getFilteredPoems(
                        page: _vm.page.value,
                        genre: _vm.genreSlug.value,
                      );
                      _vm.poems.assignAll(data['poems']);
                      _vm.totalPages.value = data['totalPages'];
                    },
                  ),
                  Text(
                    "${_vm.page.value}",
                    style: theme.textTheme.titleMedium,
                  ),
                  _vm.page.value == _vm.totalPages.value ? Container() : IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 20,),
                    onPressed: () async {
                      _vm.page.value = _vm.page.value + 1;
                      final data = await MyApi.getFilteredPoems(
                        genre: _vm.genreSlug.value,
                        page: _vm.page.value,
                      );
                      _vm.poems.assignAll(data['poems']);
                      _vm.totalPages.value = data['totalPages'];
                    },
                  ),
                ],
              ),
          ),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }

}