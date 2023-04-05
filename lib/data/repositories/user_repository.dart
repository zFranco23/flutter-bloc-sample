import '../models/user.dart';
import '../providers/user_provider.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Future<List<User>> getUsers() async {
    return userApiClient.getUsers();
  }
}
