import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/app_bar_widget.dart';
import 'package:buhoor/app/poets/poets_view_model.dart';
import 'package:buhoor/core/constants.dart';
import 'package:buhoor/core/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoetsView extends StatelessWidget {

  PoetsView({super.key});

  final _vm = Get.find<PoetsViewModel>();

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
            'الشعراء بالترتيب الأبجدي',
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: size.height * 0.02,),
          Obx(() =>
              Expanded(
                child: ListView.builder(
                  itemCount: _vm.poets.length,
                  itemBuilder: (context, idx) =>
                      Container(
                        padding: EdgeInsets.only(
                          bottom: size.height * 0.02,
                          right: size.width * 0.1,
                          left: size.width * 0.1,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyConstants.lightGrey,
                          ),
                          height: size.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _vm.poets[idx].name,
                                style: theme.textTheme.titleSmall,
                              ),
                              Text(
                                MyHelpers.getEraById(_vm.poets[idx].eraId),
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
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
                    final poets = await MyApi.getPoetsByPage(_vm.page.value);
                    _vm.poets.assignAll(poets);
                  },
                ),
                Text(
                    "${_vm.page.value}",
                    style: theme.textTheme.titleMedium,
                ),
                _vm.page.value == 47 ? Container() : IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 20,),
                  onPressed: () async {
                    _vm.page.value = _vm.page.value + 1;
                    final poets = await MyApi.getPoetsByPage(_vm.page.value);
                    _vm.poets.assignAll(poets);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.04,),
        ],
      ),
    );
  }

}