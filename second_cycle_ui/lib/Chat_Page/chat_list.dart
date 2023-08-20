import 'package:flutter/material.dart';
import 'package:second_cycle_ui/constants.dart';

import 'chat_page.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sohbetler',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: olive_yesil,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatListItem(
            user: chatList[index],
          );
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final User user;

  ChatListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(user.profileImage),
      ),
      title: Text(user.username),
      subtitle: Text(user.lastMessage),
      trailing: Text(user.lastMessageTime),
      onTap: () {
        // Sohbet ekranına yönlendirme işlemi burada yapılabilir
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
                //user: user
                ),
          ),
        );
      },
    );
  }
}

class User {
  final String username;
  final String profileImage;
  final String lastMessage;
  final String lastMessageTime;

  User({
    required this.username,
    required this.profileImage,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}

List<User> chatList = [
  User(
    username: 'Ahmet',
    profileImage: 'assets/images/user1.jpg',
    lastMessage: 'Nasılsınız?',
    lastMessageTime: '10:30 AM',
  ),
  User(
    username: 'Ayşe',
    profileImage: 'assets/images/user2.jpg',
    lastMessage: 'Merhaba!',
    lastMessageTime: '9:45 AM',
  ),
  // Diğer kullanıcılar burada eklenebilir
];
