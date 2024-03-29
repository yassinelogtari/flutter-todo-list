import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/screen/add_note_screen.dart';
import 'package:flutter_to_do_list/widgets/stream_note.dart';


import 'login.dart'; // Import your login screen

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      appBar: AppBar(
        title: Text('Your App Title'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "LogIN_Screen");
              },
            ),
          ],
      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Stream_note(false),
              Text(
                'isDone',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );
  }
}
