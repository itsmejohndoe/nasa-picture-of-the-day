import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/failures/custom_failure.dart';
import '../../domain/entities/picture.dart';
import '../../domain/usecases/get_pictures_list.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final GetPicturesList _getPicturesList;

  ListingBloc(this._getPicturesList) : super(ListingState.idle()) {
    on<LoadListing>((event, emit) => _onLoadListing(event, emit));
    on<SearchListing>((event, emit) => _onSearchListing(event, emit));
  }

  void _onLoadListing(LoadListing _, Emitter emit) async {
    emit(state.copyWith(status: ListingStatus.loading));
    final result = await _getPicturesList();
    result.fold(
      (failure) => emit(state.copyWith(status: ListingStatus.error, failure: failure)),
      (success) => emit(state.copyWith(status: ListingStatus.ready, data: success)),
    );
  }

  void _onSearchListing(SearchListing event, Emitter emit) async {
    emit(state.copyWith(search: event.searchTerm));
  }
}
