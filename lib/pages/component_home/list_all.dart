import 'package:flutter/material.dart';

class ListAllMoviesTvPage extends StatelessWidget {
  const ListAllMoviesTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Center(
          child: Text("All Categorys", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}