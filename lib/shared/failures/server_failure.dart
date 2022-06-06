import 'custom_failure.dart';

class ServerFailure extends CustomFailure {
  const ServerFailure(super.failureMessage);

  @override
  List<Object?> get props => [failureMessage];
}
