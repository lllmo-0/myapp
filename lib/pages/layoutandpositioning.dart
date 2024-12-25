import 'package:flutter/material.dart';

class LayoutAndPositioning extends StatelessWidget {
  static const String route = '/layout';
  const LayoutAndPositioning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App UI"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGridButton(
                      "Profile", Icons.person, Colors.orange, context),
                  _buildGridButton(
                      "Messages", Icons.message, Colors.purple, context),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGridButton(
                      "Settings", Icons.settings, Colors.green, context),
                  _buildGridButton(
                      "Notifications", Icons.notifications, Colors.blue, context),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Features",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                  "Photo Gallery", Icons.photo, "View your photos", Colors.orange),
              _buildFeatureTile(
                  "Tasks", Icons.check_circle, "Manage your tasks", Colors.green),
              _buildFeatureTile("Weather", Icons.cloud, "Check the weather",
                  Colors.blueAccent),
              _buildFeatureTile(
                  "Music", Icons.music_note, "Play your favorite songs", Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(
      String text, IconData icon, Color color, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: 120, // Увеличен размер кнопки для лучшего отображения
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(
      String title, IconData icon, String subtitle, Color color) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 12), // Увеличены отступы
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
