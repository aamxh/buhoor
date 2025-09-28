import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'genre_view.dart';
import 'genre_view_model.dart';

class GenresView extends StatelessWidget {

  const GenresView({super.key});

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
            'كافة الأغراض الشعرية',
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(height: size.height * 0.02,),
          Expanded(
            child: ListView.builder(
              itemCount: MyConstants.genres.length,
              itemBuilder: (context, idx) =>
                  Container(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.02,
                      right: size.width * 0.1,
                      left: size.width * 0.1,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final genreViewModel = Get.find<GenreViewModel>();
                        final data = await MyApi.getFilteredPoems(
                          genre: MyConstants.genres[idx]['slug'].toString(),
                        );
                        genreViewModel.genreName.value = MyConstants.genres[idx]['name'].toString();
                        genreViewModel.genreSlug.value = MyConstants.genres[idx]['slug'].toString();
                        genreViewModel.poems.value = data['poems'];
                        genreViewModel.totalPages.value = data['totalPages'];
                        Get.to(() => GenreView());
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MyConstants.genres[idx]["name"].toString(),
                              style: theme.textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
          SizedBox(height: size.height * 0.04,),
        ],
      ),
    );
  }

}