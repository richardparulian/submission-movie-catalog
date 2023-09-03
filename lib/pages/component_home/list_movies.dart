import 'package:flutter/material.dart';

class ListMoviesPage extends StatelessWidget {
  const ListMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Center(
          child: Text("Movies Categorys", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}