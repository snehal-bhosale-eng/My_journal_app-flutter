import 'package:flutter/material.dart';
import 'package:my_journal_app/screens/journal_screen.dart';

class JournalApp extends StatelessWidget {
  const JournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "My_Journal_App",
      debugShowCheckedModeBanner: false,
      home: const JournalScreen(),
    ));
  }
}
