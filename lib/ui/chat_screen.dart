import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/spacing.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_application_1/ui/messages_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getAllUsers(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
              body: cubit.listUserModel == null
                  ? const LinearProgressIndicator(
                      color: Colors.brown,
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) =>
                          chatItem(cubit.listUserModel![index], context),
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.brown,
                            thickness: 0.2,
                          ),
                      itemCount: cubit.listUserModel!.length));
        },
      ),
    );
  }

  Widget chatItem(UserModel user, context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => MessagesScreen(
              userModel: user,
            )));
      },
      leading: Image.network(
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
      title: Text(
        user.firstName!,
        style: const TextStyle(color: Colors.brown, fontSize: 14),
      ),
      subtitle: Text(
        user.email!,
        style: const TextStyle(color: Colors.brown, fontSize: 14),
      ),
    );
  }
}
