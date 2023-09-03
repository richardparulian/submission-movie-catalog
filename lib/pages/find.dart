import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        child: Center(
          child: Text("Find page", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}