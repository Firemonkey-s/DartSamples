import 'package:flutter/material.dart';

/*void main()=>runApp(MaterialApp(
  title: 'Page 1',
  home: Page1(),
)); */

class Page1 extends StatelessWidget {

  final String title;

  Page1(this.title);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text('Side bar App'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
