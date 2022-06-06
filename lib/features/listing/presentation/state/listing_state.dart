part of 'listing_bloc.dart';

enum ListingStatus {
  idle,
  loading,
  error,
  ready,
}

class ListingState extends Equatable {
  final ListingStatus status;
  final CustomFailure? failure;
  final String? searchTerm;
  final List<Picture>? _data;

  const ListingState(this.status, this._data, this.failure, this.searchTerm);

  factory ListingState.idle() => const ListingState(ListingStatus.idle, null, null, null);

  List<Picture>? get data {
    final list = _data;
    if (list == null) {
      return null;
    }

    final term = searchTerm;
    if (term == null || term.isEmpty) {
      return list;
    } else {
      return list.where((e) => e.title.toLowerCase().contains(term.toLowerCase()) || e.date.contains(term)).toList();
    }
  }

  ListingState copyWith({
    ListingStatus? status,
    List<Picture>? data,
    CustomFailure? failure,
    String? search,
  }) =>
      ListingState(
        status ?? this.status,
        data ?? _data,
        failure ?? this.failure,
        search,
      );

  @override
  List<Object?> get props => [status, _data, failure, searchTerm];
}
