import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/core/constants/assets_manager.dart';
import 'package:quiz/core/constants/shared_preferences_consts.dart';
import 'package:quiz/core/di/injection_container.dart';
import 'package:quiz/core/router/app_router_names.dart';
import 'package:quiz/core/shared_preferences/preference_helper.dart';
import 'package:quiz/core/styles/colors.dart';
import 'package:quiz/core/utils/media_query_extension.dart';
import 'package:quiz/core/widgets/headline_text.dart';
import 'package:quiz/core/widgets/medium_text.dart';
import 'package:quiz/feature/auth/manager/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;

  double _containerSize = 1.5;

  double _textOpacity = 0.0;

  double _containerOpacity = 0.0;

  late AnimationController _controller;

  late Animation<double> animation1;

  PreferenceHelper preferenceHelper = PreferenceHelper(preferencesProvider: serviceLocator());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preferenceHelper.getString(key: 'branch').then((value) {
      branch = value;
      debugPrint('branch $branch');
    });
    preferenceHelper.getString(key: 'personalNumber').then((value) {
      personalNumber = value;
      debugPrint('personalNumber $personalNumber');
    });

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if(branch != null && personalNumber !=null) {
        AuthCubit.get(context).getBills();
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouterNames.rHomeLayoutRoute,
              (route) => false,
        );
      }
      else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouterNames.rLoginRoute,
              (route) => false,
        );
      }
    });

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: context.screenHeight / 2.2),
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 1750),
                  opacity: _textOpacity,
                  child: HeadLineText(text: 'AR',color: AppColor.white,fontSize: 50,)),
            ],
          ),
        ],
      ),
    );
  }
}
