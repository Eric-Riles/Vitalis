import 'package:flutter/material.dart';

class FrontFootPage extends StatelessWidget {
  const FrontFootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> exercises = [
      "Toe Raises",
      "Towel Scrunches",
      "Ankle Circles",
      "Resistance Band Flexion",
      "Calf Raises",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Front Foot"),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]),
            onTap: () {
              // Do something when tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(exercises[index])),
              );
            },
          );
        },
      ),
    );
  }
}