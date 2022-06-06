import 'custom_failure.dart';

class NetworkFailure extends CustomFailure {
  const NetworkFailure(super.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}
