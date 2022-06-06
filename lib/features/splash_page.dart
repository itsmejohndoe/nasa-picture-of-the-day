import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../shared/navigation/app_router.dart';
import '../shared/resources/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () => AutoRouter.of(context).replaceAll([const ListingRoute()]));

    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Assets.images.nasaLogo.image(width: constraints.maxWidth / 2);
          },
        ),
      ),
    );
  }
}
