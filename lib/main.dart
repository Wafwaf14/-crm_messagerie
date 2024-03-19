import 'package:crm_messagerie/app/auth/home.dart';
import 'package:crm_messagerie/app/auth/login.dart';
import 'package:crm_messagerie/components/crud.dart';
import 'package:crm_messagerie/constant/linkapi.dart';
import 'dart:convert' ;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CRM Messagerie'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 60.0),
              child: GestureDetector(
                onTap: () {
                  // Handle search here
                },
                child: SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: FixedColumnLayout(),
        ),
      ),
    );
  }
}

class FixedColumnLayout extends StatefulWidget {
  @override
  _FixedColumnLayoutState createState() => _FixedColumnLayoutState();
}

class _FixedColumnLayoutState extends State<FixedColumnLayout> {
  Widget _currentPage = Page2();

  void _navigateToPage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First column with fixed width
        Container(
          color: Colors.blue,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage(Home());
                },
                child: Text('Listes'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage(Page2());
                },
                child: Text('Campagnes'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage(Login());
                },
                child: Text('Modèles'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage(Login());
                },
                child: Text('Statistiques'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _navigateToPage(Login());
                },
                child: Text('Historique'),
              ),
            ],
          ),
        ),
        // Second column with navigable content
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color.fromARGB(255, 62, 183, 29),
                  width: 1.0,
                ),
              ),
            ),
            child: _currentPage,
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  Future<dynamic> getCampagne() async {
    var response = await Crud().getRequest(linkSingUppar);
    // Process response
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          FutureBuilder(
            future: getCampagne(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // Render data
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Data is loading"));
              }
              return Center(child: Text("Data is "));
            },
          ),
        ],
      ),
    );
  }
}
