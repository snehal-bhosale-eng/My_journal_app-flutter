import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_journal_app/data/data/Journal_entry_data.dart';

class AddEntryBottom extends StatefulWidget {
  final Function(JournalEntryData) onSave;
  const AddEntryBottom({required this.onSave, super.key});

  @override
  State<StatefulWidget> createState() => AddEntryBottomState();
}

class AddEntryBottomState extends State<AddEntryBottom> {
  //text contoller
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();
  String _selectMood = "Happy";

  String getEmoji(String mood) {
    switch (mood) {
      case "Happy":
        return "😊";
      case "Sad":
        return "😔";
      case "Normal":
        return "😐";
      case "Angry":
        return "😡";
      case "Excited":
        return "🤩";
      case "Relaxed":
        return "😌";
      default:
        return "";
    }
  }

  void printData() {
    print(_textEditingController.text);
    print(_contentEditingController.text);
    _textEditingController.clear();
    _contentEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: _contentEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Content",
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Mood",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectMood,
                    items: const [
                      DropdownMenuItem(
                        value: "Happy",
                        child: Row(
                          children: [
                            Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.orange,
                            ),
                            SizedBox(height: 10),

                            Text("happy "),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Sad",
                        child: Row(
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10),
                            Text("sad "),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Normal",
                        child: Row(
                          children: [
                            Icon(Icons.sentiment_neutral, color: Colors.grey),
                            SizedBox(width: 10),
                            Text("nornal "),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Angry",
                        child: Row(
                          children: [
                            Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Text("angry "),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Excited",
                        child: Row(
                          children: [
                            Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.purple,
                            ),
                            SizedBox(width: 10),
                            Text("excited "),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Relaxed",
                        child: Row(
                          children: [
                            Icon(Icons.self_improvement, color: Colors.green),
                            SizedBox(width: 10),
                            Text("relaxed "),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectMood = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    //move to previous screen
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    JournalEntryData entry = JournalEntryData(
                      id: '0',
                      title: _textEditingController.text,
                      content: _contentEditingController.text,
                      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                      mood: _selectMood,
                      moodEmoji: getEmoji(_selectMood),
                    );

                    //setState(() {
                    //listOfData.add(entry);
                    //});

                    widget.onSave(entry);
                    Navigator.pop(context);
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
