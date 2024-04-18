import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkModeEnabled =
        themeProvider.themeData.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: isDarkModeEnabled,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
            Text(
              'Dark Mode',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
