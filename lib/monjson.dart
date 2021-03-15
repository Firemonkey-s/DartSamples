import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MonJson extends StatefulWidget {
  @override
  _MonJsonState createState() => _MonJsonState();
}

class _MonJsonState extends State<MonJson> {
  Map monjson;
  List listofFacts;

  Future getData() async{
     http.Response rep;
    rep = await http.get('https://www.thegrowingdeveloper.org/apiview?id=2');
    if(rep.statusCode == 200){
      setState(() {
        monjson = jsonDecode(rep.body);
        listofFacts = monjson['facts'];
        print(monjson);
      });
    }
   // print(monjson);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          'Mon API app',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
          body: monjson ==null ? Container():
          SingleChildScrollView(
            child: Column(
              children: [
                Text(monjson['category'].toString(),
                  style: TextStyle(fontSize: 18),
                ),

                ListView.builder(

                    shrinkWrap: true, // enlever l'erreur d'affichage
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: listofFacts.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.network(listofFacts[index]['image_url']),

                            Text(listofFacts[index]['title'].toString(),
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),

                            Text(listofFacts[index]['description'].toString(),
                              style: TextStyle(fontSize: 10, color: Colors.red),
                            ),

                          ],
                        ),
                      );

                    },

                    )
              ],
            ),
          ),
    );

  }
}
