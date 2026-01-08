import 'package:flutter/material.dart';
import 'package:my_journal_app/data/data/Journal_entry_data.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntryData entry;
  const JournalEntryCard({required this.entry, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(198, 143, 196, 201),
      shadowColor: Colors.amber,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            Text(
              entry.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(height: 10),

            Text(
              entry.content,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(height: 10),

            Text(
              entry.date,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey,
              ),
            ),
            Text("${entry.moodEmoji} ${entry.mood}"),
          ],
        ),
      ),
    );
  }
}
