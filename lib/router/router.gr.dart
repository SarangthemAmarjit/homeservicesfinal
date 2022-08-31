// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../model/model.dart' as _i11;
import '../onboarding/login.page.dart' as _i2;
import '../onboarding/register.dart' as _i7;
import '../pages/allservice.dart' as _i8;
import '../pages/detail.page.dart' as _i5;
import '../pages/home.dart' as _i3;
import '../pages/nointerpage.dart' as _i4;
import '../pages/profile.page.dart' as _i6;
import '../pages/splash_screen.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashscreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashscreenPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    NointernetRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NointernetPage());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.DetailPage(
              key: args.key,
              title: args.title,
              data: args.data,
              serviceimage: args.serviceimage));
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ProfilePage(key: args.key, userprofile: args.userprofile));
    },
    RegisterRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    },
    AllserviceRoute.name: (routeData) {
      final args = routeData.argsAs<AllserviceRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.AllservicePage(key: args.key, datalist: args.datalist));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashscreenRoute.name, path: '/'),
        _i9.RouteConfig(LoginRoute.name, path: '/login'),
        _i9.RouteConfig(HomeRoute.name, path: '/home'),
        _i9.RouteConfig(NointernetRoute.name, path: '/nointernet'),
        _i9.RouteConfig(DetailRoute.name, path: '/detail-page'),
        _i9.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i9.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i9.RouteConfig(AllserviceRoute.name, path: '/allservice-page')
      ];
}

/// generated route for
/// [_i1.SplashscreenPage]
class SplashscreenRoute extends _i9.PageRouteInfo<void> {
  const SplashscreenRoute() : super(SplashscreenRoute.name, path: '/');

  static const String name = 'SplashscreenRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i10.Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.NointernetPage]
class NointernetRoute extends _i9.PageRouteInfo<void> {
  const NointernetRoute() : super(NointernetRoute.name, path: '/nointernet');

  static const String name = 'NointernetRoute';
}

/// generated route for
/// [_i5.DetailPage]
class DetailRoute extends _i9.PageRouteInfo<DetailRouteArgs> {
  DetailRoute(
      {_i10.Key? key,
      required String title,
      required List<dynamic> data,
      required String serviceimage})
      : super(DetailRoute.name,
            path: '/detail-page',
            args: DetailRouteArgs(
                key: key,
                title: title,
                data: data,
                serviceimage: serviceimage));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs(
      {this.key,
      required this.title,
      required this.data,
      required this.serviceimage});

  final _i10.Key? key;

  final String title;

  final List<dynamic> data;

  final String serviceimage;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, title: $title, data: $data, serviceimage: $serviceimage}';
  }
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i10.Key? key, required _i11.Datum userprofile})
      : super(ProfileRoute.name,
            path: '/profile-page',
            args: ProfileRouteArgs(key: key, userprofile: userprofile));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, required this.userprofile});

  final _i10.Key? key;

  final _i11.Datum userprofile;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userprofile: $userprofile}';
  }
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i8.AllservicePage]
class AllserviceRoute extends _i9.PageRouteInfo<AllserviceRouteArgs> {
  AllserviceRoute({_i10.Key? key, required List<_i11.ItemModel> datalist})
      : super(AllserviceRoute.name,
            path: '/allservice-page',
            args: AllserviceRouteArgs(key: key, datalist: datalist));

  static const String name = 'AllserviceRoute';
}

class AllserviceRouteArgs {
  const AllserviceRouteArgs({this.key, required this.datalist});

  final _i10.Key? key;

  final List<_i11.ItemModel> datalist;

  @override
  String toString() {
    return 'AllserviceRouteArgs{key: $key, datalist: $datalist}';
  }
}
