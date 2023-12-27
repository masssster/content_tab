import 'package:content_tab/content_tab/content_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
  ContentTab contentTab = new ContentTab();
    contentTab.addTab("Tab 1",
              Container(
                height: 700,
                width: 1920,
                color: Colors.grey,
                child: Center(child: Text("Content 1",style: TextStyle(color: Colors.white),),),
              ),);
    contentTab.addTab("Tab 2",
              Container(
                height: 700,
                width: 1920,
                color: Colors.grey,
                child: Center(child: Text("Content 2",style: TextStyle(color: Colors.white)),),
              ),);
    contentTab.addTab("Tab 3",
              Container(
                height: 700,
                width: 1920,
                color: Colors.grey,
                child: Center(child: Text("Content 3",style: TextStyle(color: Colors.white)),),
              ),);
    return Scaffold(
      appBar: AppBar(
        title: Text("Content Tab Demo"),
      ),
      body: contentTab
       
    );
  }
}
