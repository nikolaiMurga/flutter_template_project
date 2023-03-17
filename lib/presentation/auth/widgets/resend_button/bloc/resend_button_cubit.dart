import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'resend_button_state.dart';

@injectable
class ResendButtonCubit extends Cubit<ResendButtonState> {
  ResendButtonCubit() : super(ResendButtonInitial());

  void startTimer() {
    emit(StartTimer());
    emit(ResendButtonInitial());
  }
}
