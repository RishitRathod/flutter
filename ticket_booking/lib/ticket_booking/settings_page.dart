import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: const Center( // Centers the text in the body
        child: Text(
          'Hello World',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 24),
        ),
      ),
    );
  }
}
