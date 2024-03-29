import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor:Colors.grey.shade300,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your Email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration (
                        color: Colors.grey.shade200,
                        border: Border.all(color:Colors.grey),
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: passwordReset,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Changer ici le radius selon votre choix
                ),
              ),
              child: Text('Send Reset Link',),
            ),
          ],
        ),
      ),
    );
  }
}
