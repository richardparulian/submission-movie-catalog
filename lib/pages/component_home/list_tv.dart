import 'package:flutter/material.dart';

class ListTvPage extends StatelessWidget {
  const ListTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        child: Center(
          child: Text("Tv Categorys", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}