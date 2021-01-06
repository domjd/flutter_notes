import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/list_model.dart';

class NoteScreen extends StatefulWidget {
  final Note note;

  NoteScreen({this.note});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleTextController =
      new TextEditingController();
  final TextEditingController _contentTextController =
      new TextEditingController();

  final FocusNode _focusNode = new FocusNode();

  @override
  void initState() {
    _titleTextController.text = widget.note.title;
    _contentTextController.text = widget.note.content;
    super.initState();
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff64b5f6),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.save),
          )
        ],
      ),
      body: ListView(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                      child: TextField(
                        controller: _titleTextController,
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.yellow[100],
                            hintText: 'sdskjdhsk',
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0.0),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0)),
                child: GestureDetector(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color(0xff64b5f6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: null,
                          expands: false,
                          focusNode: _focusNode,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.multiline,
                          controller: _contentTextController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: false,
                              fillColor: Colors.yellow[100],
                              hintText: 'sdskjdhsk',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.0),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.blue,
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: ''),
      ),
    );
  }
}
