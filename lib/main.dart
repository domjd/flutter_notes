import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_model.dart';

import 'note_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test App'),
      //   centerTitle: true,
      //   backgroundColor: Color(0xff64b5f6),
      //   elevation: 0,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 2,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                if (index == 0) {
                  return SizedBox(width: 20);
                }
                if (index == categories.length + 1) {
                  return Row(
                    children: [
                      Ink(
                        decoration: const ShapeDecoration(
                            color: Color(0xFFe3f2fd), shape: CircleBorder()),
                        child: IconButton(
                          onPressed: () {
                            print("Add note");
                          },
                          icon: Icon(Icons.add),
                          color: Color(0xFFAFB4C6),
                        ),
                      ),
                      SizedBox(width: 20.0)
                    ],
                  );
                }
                return _buildCategoryCard(
                    index - 1,
                    categories.keys.toList()[index - 1],
                    categories.values.toList()[index - 1]);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes',
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _noteListItem(index, notes[index].title,
                        notes[index].content, notes.length);
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff64b5f6),
        onPressed: () {
          print('add note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _noteListItem(int index, String title, String content, int count) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
      onTap: () {
        print(title);
        Note note = new Note();
        note.title = title;
        note.content = content;
        note.date = DateTime.now();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => NoteScreen(note: note)));
      },
    );
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        height: 240,
        width: 175,
        decoration: BoxDecoration(
            color: _selectedCategoryIndex == index
                ? Color(0xff64b5f6)
                : Color(0xFFe3f2fd),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              _selectedCategoryIndex == index
                  ? BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 10.0)
                  : BoxShadow(color: Colors.transparent)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(title,
                    style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? Colors.white
                          : Color(0xFFAFB4C6),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ))),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
