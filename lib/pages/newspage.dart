import 'dart:math'; // For random name generation
import 'package:flutter/material.dart';

class Newspage extends StatefulWidget {
  static const String route = '/';
  const Newspage({super.key});

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  bool isDarkMode = false; // Track current theme mode
  String randomName = "John Doe"; // Default name for randomization

  // List of random names to pick from
  List<String> names = [
    "Ainura",
    "Daniyar",
    "Kanybek",
    "Emir",
    "Berdibek",
    "Ulanbek",
    "Eslar",
    "Argen"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        actions: [
          // Switch to toggle dark/light theme
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: Container(
        // Set background color based on theme and make it take full height
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Random Name Button
            ElevatedButton(
              onPressed: _generateRandomName,
              child: Text("Generate Random Name"),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode
                    ? Colors.blueGrey
                    : Colors.blue, // Button color based on theme
              ),
            ),
            SizedBox(height: 20),

            // Display the randomized name
            Text(
              'Random Name: $randomName',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? Colors.white
                    : Colors.black, // Text color for dark mode
              ),
            ),
            SizedBox(height: 20),

            // Ensure the content fills up the remaining space
            Expanded(
              child: Container(), // Use Expanded to fill up space below
            ),
          ],
        ),
      ),
    );
  }

  // Function to generate a random name from the list
  void _generateRandomName() {
    final random = Random();
    setState(() {
      randomName = names[random.nextInt(names.length)];
    });
  }
}
