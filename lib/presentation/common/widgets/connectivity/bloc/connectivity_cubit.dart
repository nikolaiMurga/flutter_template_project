import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/app/services/connectivity_service.dart';
import 'package:injectable/injectable.dart';

part 'connectivity_state.dart';

@injectable
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final ConnectivityService _connectivityService;

  ConnectivityCubit(this._connectivityService) : super(ConnectivityInitial());

  void checkConnectivity() {
    _connectivityService.connectivityTracker.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityNone());
      } else {
        emit(ConnectivitySucceed());
      }
    });
  }
}
