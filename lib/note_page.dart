// ignore_for_file: prefer_const_constructors

import 'package:dashnotes/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class NotePage extends StatelessWidget {
  final Note? note;
  const NotePage({
    this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Note currentNote = note ?? Note(title: "", body: "", date: DateTime.now());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  elevation: 0,
                  shape: CircleBorder(),
                  color: Color(0xFFFEF3F2),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Color(0xFFF96C61),
                  ),
                ),
                Text(
                  DateFormat('MMMM d, yyyy').format(DateTime.now()),
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                ),
                MaterialButton(
                  elevation: 0,
                  shape: CircleBorder(),
                  color: Color.fromARGB(255, 230, 255, 234),
                  onPressed: () {
                    Navigator.pop(context, currentNote);
                  },
                  child: Icon(
                    Icons.done,
                    color: Color.fromARGB(255, 97, 249, 130),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextFormField(
                initialValue: note?.title,
                onChanged: (value) {
                  currentNote.title = value;
                },
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextFormField(
                initialValue: note?.body,
                onChanged: (value) {
                  currentNote.body = value;
                },
                maxLines: 15,
                decoration: InputDecoration(
                    hintText: "Write...", border: InputBorder.none),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
