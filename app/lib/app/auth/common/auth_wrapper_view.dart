import 'package:buhoor/app/auth/common/auth_api.dart';
import 'package:buhoor/app/auth/sign_in/sign_in_view.dart';
import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/main/home_view.dart';
import 'package:buhoor/app/main/home_view_model.dart';
import 'package:buhoor/app/poem/poem_view_model.dart';
import 'package:buhoor/app/poets/poet_view_model.dart';
import 'package:buhoor/app/poets/poets_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapperView extends StatelessWidget {

  const AuthWrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder(
      future: AuthApi.isUserAuthenticated(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: CircularProgressIndicator(
            color: theme.colorScheme.secondary,
          ),);
        }
        final tokenIsValid = snapshot.data!;
        if (tokenIsValid) {
          Get.put(HomeViewModel());
          Get.put(PoetsViewModel());
          Get.put(PoemViewModel());
          Get.put(PoetViewModel());
          return HomeView();
        }
        return SignInView();
      },
    );
  }

}