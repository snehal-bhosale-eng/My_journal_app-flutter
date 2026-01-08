import 'package:flutter/material.dart';
import 'package:my_journal_app/data/data.dart';
import 'package:my_journal_app/widgets/Journal_entry_card.dart';
import 'package:my_journal_app/widgets/add_entry_bottom.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Daily Thoughts",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(199, 114, 196, 195),
      ),

      body: ListView.builder(
        itemCount: listOfData.length,
        itemBuilder: (context, index) {
          return JournalEntryCard(entry: listOfData[index]);
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddEntryBottom(
                onSave: (entry) {
                  setState(() {
                    listOfData.add(entry);
                  });
                },
              );
            },
          );
        },
        backgroundColor: Colors.amber,
        hoverColor: Colors.lightGreen,
        child: Icon(Icons.add, color: Colors.cyanAccent),
      ),
    );
  }
}
