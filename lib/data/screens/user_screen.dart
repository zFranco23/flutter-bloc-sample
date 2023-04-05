import 'package:bloc_sample/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/user_bloc.dart';
import '../../data/blocs/user_event.dart';
import '../../data/blocs/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Column(children: [
        Expanded(child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserEmptyState) {
              return const Center(
                child: Text('Press the button to fetch users'),
              );
            } else if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoadedState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].email),
                  );
                },
              );
            } else if (state is UserErrorState) {
              return Center(
                child: Text('Error fetching users: ${state.message}'),
              );
            } else {
              return const Center(
                child: Text('Unknown state'),
              );
            }
          },
        ))
      ]),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(GetUsers());
          },
          child: Icon(Icons.refresh),
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(GetUsers());
          },
          child: CustomButton(),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
