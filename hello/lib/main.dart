import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// This is the root widget of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeting App', // Title for the application.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color theme.
        useMaterial3: true, // Using Material 3 design.
      ),
      // This is the main content where we pass the GreetingPage as the home screen.
      home: const GreetingPage(
          title:
              'Hello Rishit'), // Set the initial screen with 'Hello Username' as title.
    );
  }
}

// The GreetingPage is a StatefulWidget that handles the interaction and display of messages.
class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key, required this.title});

  final String title; // Title displayed in the AppBar.

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

// State of the GreetingPage, where dynamic content is handled.
class _GreetingPageState extends State<GreetingPage> {
  // This string will hold the greeting message.
  String greetingMessage = ''; // Initially empty message.

  // This function is triggered when the button is pressed.
  void _showGreeting() {
    setState(() {
      greetingMessage =
          'Welcome, Rishit'; // Change the message on button press.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar displays the 'Hello Username' text.
        title: Text(widget.title),
      ),
      body: Center(
        // Center aligns the content in the middle of the screen.
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Vertically center the widgets.
          children: <Widget>[
            Text(
              greetingMessage.isEmpty
                  ? 'Press the button to see a message!' // Default message before button press.
                  : greetingMessage, // Display the greeting message after the button is pressed.
              style:
                  Theme.of(context).textTheme.headlineMedium, // Text styling.
            ),
            const SizedBox(height: 20), // Add space between text and button.
            ElevatedButton(
              onPressed:
                  _showGreeting, // On button press, call _showGreeting function.
              child: const Text('Press to Greet'), // Button label.
            ),
          ],
        ),
      ),
    );
  }
}
