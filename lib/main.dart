import 'package:flutter/material.dart';
import './Page1.dart';
import './Page2.dart';
import './Page3.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => Page1('Ma première page'),
        '/route2': (BuildContext context) => Page1('Ma deuxième page'),
        '/route3': (BuildContext context) => Page1('Ma troisième page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Side bar'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Header')),
            CustomListTile(Icons.person,'Menu... 1', ()=>{Navigator.pushNamed(context, '/route1')}),
            CustomListTile(Icons.notifications,'Menu... 2', ()=>{Navigator.pushNamed(context, '/route2')}),
            CustomListTile(Icons.settings,'Menu... 3', ()=>{Navigator.pushNamed(context, '/route3')}),
            CustomListTile(Icons.lock,'Menu... 4', ()=>{}),
          ],
        ),
      ),
      body: Center(
        child:
            Text(
              'Page1'
            )
      ),
      );
   }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: onTap,
        child:
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                 color: Colors.grey
            ))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [Row(

              children: [Icon(icon),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(text,
                    style: TextStyle(
                        fontSize:16 )
                    ) ,
                ),
                Icon(Icons.arrow_right)
              ],
            )]
            ,
          ),
        ),
      ),
    );
  }
}

