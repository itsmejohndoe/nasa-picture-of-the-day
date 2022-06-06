import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/listing/domain/entities/picture.dart';
import '../../features/listing/presentation/pages/details_page.dart';
import '../../features/listing/presentation/pages/listing_page.dart';
import '../../features/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: ListingPage),
    CupertinoRoute(page: DetailsPage),
  ],
)
class AppRouter extends _$AppRouter {}
