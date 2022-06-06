import 'package:equatable/equatable.dart';

import '../../../../shared/failures/custom_failure.dart';
import '../../domain/entities/picture.dart';

enum ListingStatus {
  idle,
  loading,
  error,
  ready,
}

class ListingState extends Equatable {
  final ListingStatus status;
  final List<Picture>? data;
  final CustomFailure? failure;

  const ListingState(this.status, this.data, this.failure);

  factory ListingState.idle() => const ListingState(ListingStatus.idle, null, null);

  ListingState copyWith({ListingStatus? status, List<Picture>? data, CustomFailure? failure}) => ListingState(
        status ?? this.status,
        data ?? this.data,
        failure ?? this.failure,
      );

  @override
  List<Object?> get props => [status, data, failure];
}
