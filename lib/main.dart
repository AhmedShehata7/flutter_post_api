import 'package:flutter/material.dart';
import 'package:flutter_post_api/services/note_service.dart';
import 'package:flutter_post_api/views/note_list.dart';
import 'package:get_it/get_it.dart';
void setupLocator(){
GetIt.I.registerLazySingleton(() => NoteService());
}

void main() {
  runApp(App());
  setupLocator();
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}