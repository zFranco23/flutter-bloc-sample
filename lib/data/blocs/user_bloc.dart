import 'package:bloc_sample/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<GetUsers>(_onGetUsers);
  }

  Future<void> _onGetUsers(GetUsers event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState(isLoading: true));
      final List<User> users = await userRepository.getUsers();
      emit(UserLoadedState(users: users));
    } catch (e) {
      emit(UserErrorState(message: e.toString()));
    }
  }
}
