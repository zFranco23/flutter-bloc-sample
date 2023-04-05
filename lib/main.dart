import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/blocs/user_bloc.dart';
import 'data/providers/user_provider.dart';
import 'data/repositories/user_repository.dart';
import 'data/screens/user_screen.dart';

void main() {
  final UserApiClient userApiClient = UserApiClient(
    httpClient: http.Client(),
  );

  final UserRepository userRepository = UserRepository(
    userApiClient: userApiClient,
  );

  runApp(
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository: userRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
    );
  }
}
