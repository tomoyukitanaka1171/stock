import 'package:bottom_nav_app/domain/chat.dart';
import 'package:bottom_nav_app/model/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatModel>(
        create: (_) => ChatModel()..fetchChat(),
        builder: (context, snapshot) {
          return Consumer<ChatModel>(builder: (context, model, child) {
            List<Chat>? chats = model.chats;

            print(chats);

            if (chats == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = chats
                .map((chat) => Column(
                      children: [
                        if (chat.content == "")
                          Container()
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      chat.name,
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    chat.content,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 28.0),
                                    child: Text(
                                      DateFormat('MM月dd日 HH:mm')
                                          .format(chat.createdAt.toDate()),
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                )
                              ],
                            ),
                          ),
                      ],
                    ))
                .toList();

            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widgets.length,
                itemBuilder: (context, index) {
                  return widgets[index];
                },
              ),
            );
          });
        });
  }
}
