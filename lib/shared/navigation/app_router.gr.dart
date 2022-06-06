// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    ListingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ListingPage());
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return CupertinoPageX<dynamic>(
          routeData: routeData,
          child: DetailsPage(key: args.key, picture: args.picture));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(ListingRoute.name, path: '/listing-page'),
        RouteConfig(DetailsRoute.name, path: '/details-page')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [ListingPage]
class ListingRoute extends PageRouteInfo<void> {
  const ListingRoute() : super(ListingRoute.name, path: '/listing-page');

  static const String name = 'ListingRoute';
}

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({Key? key, required Picture picture})
      : super(DetailsRoute.name,
            path: '/details-page',
            args: DetailsRouteArgs(key: key, picture: picture));

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.picture});

  final Key? key;

  final Picture picture;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, picture: $picture}';
  }
}
