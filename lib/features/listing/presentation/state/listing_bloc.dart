import 'package:bloc/bloc.dart';

import '../../domain/usecases/get_pictures_list.dart';
import 'listing_event.dart';
import 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetPicturesList _getPicturesList;

  ListingBloc(this._getPicturesList) : super(ListingState.idle()) {
    on<LoadListing>((event, emit) => _onLoadListing(event, emit));
  }

  void _onLoadListing(LoadListing _, Emitter emit) async {
    emit(state.copyWith(status: ListingStatus.loading));
    final result = await _getPicturesList();
    result.fold(
      (failure) => emit(state.copyWith(status: ListingStatus.error, failure: failure)),
      (success) => emit(state.copyWith(status: ListingStatus.ready, data: success)),
    );
  }
}
