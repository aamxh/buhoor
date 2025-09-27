import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/core/constants.dart';
import 'package:flutter/material.dart';

class ErasView extends StatelessWidget {

  const ErasView({super.key});

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
            'كافة العصور الشعرية',
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(height: size.height * 0.02,),
          Expanded(
                child: ListView.builder(
                  itemCount: MyConstants.eras.length,
                  itemBuilder: (context, idx) =>
                      Container(
                        padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.1,
                          left: size.width * 0.1,
                        ),
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
                                MyConstants.eras[idx]["name"].toString(),
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
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