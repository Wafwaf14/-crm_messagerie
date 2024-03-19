import 'package:flutter/material.dart';
import 'dart:convert' ;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body :Container(//alignment: ,
        child: Row(
          children: [
           Expanded(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: List.generate(
                        10,
                        (index) => TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              'Column ${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableRow(
                      children: List.generate(
                        10,
                        (index) => TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.grey[800],
                            child: Text(
                              'Data ${(index + 1) * 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableRow(
                      children: List.generate(
                        10,
                        (index) => TableCell(
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: Text(
                              'Data ${(index + 1) * 2}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
      ),);
  }}
