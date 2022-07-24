import 'package:flutter/material.dart';

import 'admin/dashboard.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Dashboard(title: 'Library Admin'),
    );
  }
}
