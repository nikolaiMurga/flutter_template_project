part of 'connectivity_cubit.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object?> get props => [];
}

class ConnectivityNone extends ConnectivityState {
  @override
  List<Object?> get props => [];
}

class ConnectivitySucceed extends ConnectivityState {
  @override
  List<Object?> get props => [];
}
