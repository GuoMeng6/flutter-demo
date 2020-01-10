import 'package:flutter/material.dart';

class Learn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
        backgroundColor: Colors.blue,
      ),
      body: LearnContainer(),
      backgroundColor: Colors.blueAccent,
    );
  }
}

class LearnContainer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LearnContainerState();
  }
}

class LearnContainerState extends State<LearnContainer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('Learn',),
      ),
    );
  }
}