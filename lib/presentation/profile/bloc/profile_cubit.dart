import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getData() async {
    emit(ProfileProcessing());
    await Future.delayed(const Duration(seconds: 1));
    emit(ProfileSucceed());
  }
}
