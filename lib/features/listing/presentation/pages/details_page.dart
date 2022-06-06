import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/app_dimens.dart';
import '../../domain/entities/picture.dart';

class DetailsPage extends StatefulWidget {
  final Picture picture;

  const DetailsPage({Key? key, required this.picture}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  static const _appBarHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Hero(
                tag: widget.picture.featuredImageUrl,
                child: CachedNetworkImage(imageUrl: widget.picture.featuredImageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppDimens.padding02),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    widget.picture.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: AppDimens.innerPadding),
                  Text(
                    widget.picture.date,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: AppDimens.padding03),
                  Text(
                    widget.picture.explanation,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
