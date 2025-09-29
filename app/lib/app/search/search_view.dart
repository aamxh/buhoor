import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/app/poem/poem_view.dart';
import 'package:buhoor/app/poem/poem_view_model.dart';
import 'package:buhoor/app/poets/poet_view.dart';
import 'package:buhoor/app/poets/poet_view_model.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_view_model.dart';

class SearchView extends StatefulWidget {

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();

}

class _SearchViewState extends State<SearchView> {

  @override
  void initState() {
    super.initState();
    _vm.search();
  }

  final _vm = Get.find<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          SizedBox(height: size.height * 0.02,),
          Text(
             'نتائج البحث ل: ${_vm.word.value}',
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(height: size.height * 0.02,),
          Obx(() =>
            _vm.searchEnded.value ?
            _vm.poemsSearched.isNotEmpty || _vm.poetsSearched.isNotEmpty ? Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  itemCount: _vm.poemsSearched.length + _vm.poetsSearched.length,
                  itemBuilder: (context, idx) {
                    if (idx < _vm.poemsSearched.length) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: GestureDetector(
                          onTap: () {
                            Get.find<PoemViewModel>().poem.value = _vm.poemsSearched[idx];
                            Get.to(() => PoemView());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 2,
                                  color: MyConstants.grey
                              ),
                              color: theme.primaryColor == Colors.white ?
                              MyConstants.lightGrey :
                              MyConstants.darkGrey,
                            ),
                            height: size.height * 0.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _vm.poemsSearched[idx].title,
                                  style: theme.textTheme.titleSmall,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      _vm.poemsSearched[idx].poet,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    Text(
                                      _vm.poemsSearched[idx].meter,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      idx = idx - _vm.poemsSearched.length;
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: GestureDetector(
                          onTap: () async {
                            final poetViewModel = Get.find<PoetViewModel>();
                            final data = await MyApi.getFilteredPoems(
                              poet: _vm.poetsSearched[idx].slug,
                            );
                            poetViewModel.poet.value = _vm.poetsSearched[idx];
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
                            height: size.height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  _vm.poetsSearched[idx].name,
                                  style: theme.textTheme.titleSmall,
                                ),
                                Text(
                                  _vm.poetsSearched[idx].era,
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
            ) :
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06),
              child: Text(
                'لا توجد نتائج للبحث.',
                style: theme.textTheme.titleMedium,
              ),
            ) :
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06),
              child: Center(
                child: CircularProgressIndicator(
                  color: MyConstants.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}