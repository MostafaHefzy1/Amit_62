import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/base_widgets/custom_app_bar.dart';
import 'package:flutter_application_1/core/base_widgets/custom_text_form_filed.dart';
import 'package:flutter_application_1/core/local/shared_preferences_helper.dart';
import 'package:flutter_application_1/core/models/message_model.dart';
import 'package:flutter_application_1/core/models/user_model.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatelessWidget {
  final UserModel userModel;

  const MessagesScreen({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getMessages(userModel.uId!),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
              appBar: const CustomAppBar(
                title: "Messages Screen",
                isBack: true,
              ),
              body: cubit.listMessageModel == null
                  ? LinearProgressIndicator(
                      color: Colors.brown,
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemBuilder: (context, index) =>
                                  messageItem(cubit.listMessageModel![index]),
                              itemCount: cubit.listMessageModel!.length),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormFiled(
                              prefixIcon: Icons.message_rounded,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.storeMessage(userModel.uId!);
                                  },
                                  icon: const Icon(Icons.send)),
                              hintText: "Write Message ....",
                              validator: () {},
                              controller: cubit.messageController),
                        )
                      ],
                    ));
        },
      ),
    );
  }

  Widget messageItem(MessageModel message) {
    return Align(
      alignment: message.senderID == SharedPreferencesHelper.getData(key: "uid")
          ? AlignmentDirectional.centerStart
          : AlignmentDirectional.centerEnd,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            color:
                message.senderID == SharedPreferencesHelper.getData(key: "uid")
                    ? Colors.brown
                    : Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: Text(
          message.message!,
          style: TextStyle(
              color:  Colors.white),
        ),
      ),
    );
  }
}
