import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashscreenPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;

  startTime() async {
    var _duration = const Duration(seconds: 6);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey('statuscode')) {
          prefs.remove('statuscode');
        }
        if (prefs.containsKey('jwt')) {
          context.router.replaceNamed('/home');
        } else {
          context.router.replaceNamed('/login');
        }
      }
    } on SocketException catch (_) {
      context.router.replaceNamed('/nointernet');
    }
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/splash.png',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
