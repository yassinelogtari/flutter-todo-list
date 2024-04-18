import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/data/firestor.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart'; // Import the theme provider

class Add_creen extends StatefulWidget {
  const Add_creen({Key? key});

  @override
  State<Add_creen> createState() => _Add_creenState();
}

class _Add_creenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { // Use the Consumer widget to listen to changes
        return Scaffold(
          backgroundColor: themeProvider.themeData.backgroundColor, // Use the theme color
          body: SafeArea(
            child: Center( // Center your content
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                  children: [
                    SizedBox(height: 50),
                    title_widgets(themeProvider), // Pass themeProvider to title_widgets
                    SizedBox(height: 20),
                    subtite_wedgite(themeProvider), // Pass themeProvider to subtite_wedgite
                    SizedBox(height: 20),
                    imagess(),
                    SizedBox(height: 20),
                    button()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
            Navigator.pop(context);
          },
          child: Text(
            'add task',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: Size(170, 48),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ],
    );
  }

  Container imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexx = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: indexx == index ? Colors.deepPurple : Colors.deepPurple.shade100,
                  ),
                ),
                width: 140,
                height: 50,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('images/${index}.png'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title_widgets(ThemeProvider themeProvider) { // Pass themeProvider parameter
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Title',
            hintStyle: TextStyle(color: themeProvider.themeData.backgroundColor == Colors.black ? Colors.white : Colors.grey), // Change hint text color based on theme
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding subtite_wedgite(ThemeProvider themeProvider) { // Pass themeProvider parameter
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            hintText: 'Description',
            hintStyle: TextStyle(color: themeProvider.themeData.backgroundColor == Colors.black ? Colors.white : Colors.grey), // Change hint text color based on theme
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
