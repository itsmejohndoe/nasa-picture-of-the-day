import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_pictures_list.dart';
import 'listing_event.dart';
import 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetPicturesList _getPicturesList;

  ListingBloc(this._getPicturesList) : super(ListingState.idle()) {
    on<LoadListing>((event, emit) => _onLoadListing(event, emit));
  }

  void _onLoadListing(LoadListing _, Emitter emitter) {}
}
