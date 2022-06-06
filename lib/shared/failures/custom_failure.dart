import 'package:equatable/equatable.dart';

abstract class CustomFailure extends Equatable {
  final String failureMessage;

  const CustomFailure(this.failureMessage);
}
