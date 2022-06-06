part of 'listing_bloc.dart';

abstract class ListingEvent {}

class LoadListing extends ListingEvent {}

class SearchListing extends ListingEvent {
  final String? searchTerm;

  SearchListing(this.searchTerm);
}
