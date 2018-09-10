// Import flutter helper library
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

// Create a class that will be our widget
class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    var response = await get('https://api.unsplash.com/photos/random?w=600&h=600&fit=crop&client_id=a04be2eaa91394261b8131d9bfab5f1ba5a6e8345e108b5b614ea32914ea6977');
    var imageModel = ImageModel(json.decode(response.body));
    setState(() {
      counter += 1;
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Images in Heaps!"),
          centerTitle: true,
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}

// Must define a 'build' method that returns the widgets that *this* widget will show.
