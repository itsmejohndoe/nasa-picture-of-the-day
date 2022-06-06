import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../shared/resources/app_dimens.dart';
import '../state/listing_bloc.dart';
import '../widgets/picture_card.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  final _listingBloc = di<ListingBloc>();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _listingBloc.add(LoadListing());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListingBloc, ListingState>(
        bloc: _listingBloc,
        builder: (context, state) {
          if (state.data == null && (state.status == ListingStatus.idle || state.status == ListingStatus.loading)) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == ListingStatus.error) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.padding04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error loading pictures.'),
                    const SizedBox(height: AppDimens.padding),
                    TextButton(
                      child: const Text('Try again'),
                      onPressed: () => _listingBloc.add(LoadListing()),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                _listingBloc.add(LoadListing());
                await Future.delayed(const Duration(milliseconds: 100));
                while (_listingBloc.state.status == ListingStatus.loading) {
                  await Future.delayed(const Duration(milliseconds: 100));
                }
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    titleSpacing: AppDimens.padding,
                    title: Center(
                      child: SizedBox(
                        height: kMinInteractiveDimension,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: AppDimens.padding02),
                            hintText: 'search by title or date',
                            suffixIcon: _listingBloc.state.searchTerm != null
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.cancel,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      _searchController.clear();
                                      _listingBloc.add(SearchListing(null));
                                    },
                                  )
                                : null,
                          ),
                          onChanged: (value) => _listingBloc.add(SearchListing(value.isEmpty ? null : value)),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => PictureCard(picture: state.data![index]),
                      childCount: state.data!.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
