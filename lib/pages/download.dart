import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        child: Center(
          child: Text("Download page", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ),
    );
  }
}