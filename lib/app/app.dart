import 'package:flutter/material.dart';
import 'package:homeservice/core/multiprovider.wrapper.dart';
import 'package:homeservice/core/multirepository.wrapper.dart';
import 'package:homeservice/router/router.gr.dart';

import '../onboarding/login.page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultirepositoryWrapper(
      child: MultiproviderWrapper(
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
