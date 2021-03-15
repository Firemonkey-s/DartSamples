import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'monjson.dart';

void main()  => runApp(MaterialApp(
 // home: MonAPI(),
 // initialRoute: '/MonJson',
  routes: {
    '/' : (context) => MonJson(),
    '/MonAPI' : (context) => MonAPI()
  },
));

class MonAPI extends StatefulWidget {
  @override
  _MonAPIState createState() => _MonAPIState();
}

class _MonAPIState extends State<MonAPI> {
    // String data;
     List ListString;
       Future getData() async {
         http.Response reponse;
         reponse = await  http.get('https://www.thegrowingdeveloper.org/apiview?id=4');
       // String data =   reponse.body;
         if(reponse.statusCode == 200){
           setState(() {
             ListString = jsonDecode(reponse.body)  ;
           });
         }

       // print(data);
       }

   @override
  void initState() {
    //appel de la fonction
     getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Mon API',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(ListString[2].toString(),
            style: TextStyle( fontSize: 18),
          ),

          RaisedButton(
              onPressed: () {Navigator.pushNamed(context, '/monjson');},
            child: Text('Next',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),) ,

          )
        ],
      ),

    );
  }
}



