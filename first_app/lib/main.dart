import 'package:flutter/material.dart';
import './item_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple),
      home: _HomePage(),);
  }
}

class _HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          appBar: AppBar(
            title: Text('TODO Application'),
          ),
          body: Stack(
            children: [
              Center(
                child: new Image.asset(
                  'assets/todo.jpg',
                  width: size.width+100,
                  height: size.height+100,
                  fit: BoxFit.fill,
                ),
              ),
              Center(child: ItemManager('To do TODO Application'),)
              
            ],
          ),);
  }
}
