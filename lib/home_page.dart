// ignore_for_file: prefer_const_constructors

import 'package:dashnotes/note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF96C61),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      Note? note = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotePage(),
                          ));
                      if (note != null &&
                          (note.body.isNotEmpty && note.title.isNotEmpty)) {
                        setState(() {
                          notes.add(note);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.add_rounded,
                      size: 30,
                    ))
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade900,
            endIndent: 5,
            indent: 5,
            thickness: 2,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  Note? updatedNote = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotePage(note: notes[index]),
                      ));

                  if (updatedNote != null &&
                      updatedNote.body.isNotEmpty &&
                      updatedNote.title.isNotEmpty) {
                    setState(() {
                      notes[index] = Note(
                          body: updatedNote.body,
                          title: updatedNote.title,
                          date: DateTime.now());
                    });
                  }
                },
                child: ListTile(
                  minVerticalPadding: 10,
                  title: Text(
                    notes[index].title,
                    style: TextStyle(
                        color: Color(0xFFF96C61), fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    notes[index].body,
                    maxLines: 2,
                  ),
                  tileColor: Color.fromARGB(255, 255, 227, 226),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
