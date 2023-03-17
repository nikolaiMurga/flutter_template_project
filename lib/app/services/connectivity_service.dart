import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityService {
  Stream<ConnectivityResult> get connectivityTracker => Connectivity().onConnectivityChanged;
}
