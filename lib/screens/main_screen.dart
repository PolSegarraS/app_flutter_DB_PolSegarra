import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            // Add your save logic here
          },
        ),
      ),
    );
  }
}
