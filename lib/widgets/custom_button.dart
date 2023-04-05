import 'package:bloc_sample/data/blocs/user_bloc.dart';
import 'package:bloc_sample/data/blocs/user_state.dart';
import 'package:bloc_sample/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí puedes acceder al estado actual de MyFirstBloc y MySecondBloc

    return BlocSelector<UserBloc, UserState, List<User>>(
      selector: (state) {
        return state.users;
        // return selected state based on the provided state.
      },
      builder: (context, state) {
        print('Building this');
        return Text('hola, ${state.length}');
        // return widget here based on the selected state.
      },
    );
  }
}
