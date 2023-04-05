import '../models/user.dart';

abstract class UserState {
  final List<User> users;
}

class UserInitialState extends UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {
  final bool isLoading;
  UserLoadingState({required this.isLoading});
}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState({required this.users});
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}
