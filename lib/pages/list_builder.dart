import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: ListCheck(),
  ));
}

class ListCheck extends StatefulWidget {
  @override
  _ListCheckState createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {

  Map data;
  List placeData;

  Future getData() async {
    http.Response response = await http.get("http://covid-su.herokuapp.com");
    data = json.decode(response.body);
    if (!mounted) return;
    setState(() {
      placeData = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: placeData == null ? 0 : placeData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.transparent,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  
                  children: <Widget>[
                    Container(
                          constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
                          padding: EdgeInsets.only(top: 10,left: 10),
                          child: Text(
                            "${placeData[index][1]}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    Container(
                          constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
                          padding: EdgeInsets.only(top: 10, right: 20, left: 30),
                          child: Text(
                            "${placeData[index][5]}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    Container(
                          constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
                          padding: EdgeInsets.only(top: 10, left: 20,),
                          child: Text(
                            "${placeData[index][2]}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    Container(
                          padding: EdgeInsets.only(top: 10, right: 20),
                          child: Text(
                            "${placeData[index][4]}",
                            style: TextStyle(
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}