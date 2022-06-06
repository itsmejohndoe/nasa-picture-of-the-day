import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/navigation/app_router.dart';
import '../../../../shared/resources/app_dimens.dart';
import '../../domain/entities/picture.dart';

class PictureCard extends StatelessWidget {
  static const _cardHeight = 300.0;

  final Picture picture;

  const PictureCard({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: _cardHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: picture.featuredImageUrl,
                      child: CachedNetworkImage(imageUrl: picture.featuredImageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(child: Container(color: Colors.black26)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.padding02),
                      child: Text(
                        picture.title,
                        style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.padding02),
                      child: Text(
                        picture.date,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.5,
              color: Colors.white,
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => AutoRouter.of(context).push(DetailsRoute(picture: picture)),
            ),
          ),
        ),
      ],
    );
  }
}
