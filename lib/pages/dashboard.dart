import 'package:flutter_Covid_dashboard_India/pages/list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_Covid_dashboard_India/pages/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StatPage extends StatefulWidget {
  @override
  _StatPageState createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  Map data;
  List placeData;
  var ind_tot = 0;
  var ind_rec = 0;
  var ind_ded = 0;
  var num_1 = 0;
  var num_2 = 0;
  var num_3 = 0;

  Future getData() async {
    http.Response response = await http.get("http://covid-su.herokuapp.com");
    data = json.decode(response.body);
    if (!mounted) return;
    setState(() {
      placeData = data['data'];
    });
    for (var i = 0; i < 34; i++) {
      num_1 = int.parse("${placeData[i][5]}");
      ind_tot = ind_tot + num_1;
      num_2 = int.parse("${placeData[i][2]}");
      ind_rec = ind_rec + num_2;
      num_3 = int.parse("${placeData[i][4]}");
      ind_ded = ind_ded + num_3;
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(207, 0, 205, 30),
                  color: Colors.blueGrey[700],
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: screenHeight * 0.135),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 9, 16, 0),
                  margin: const EdgeInsets.fromLTRB(14, 15, 14, 0),
                  height: screenHeight * 0.31,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[700],
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    color: Colors.yellowAccent[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Assam',
                          style: TextStyle(
                            fontFamily: 'Monterrsat',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Confirmed',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Recovered',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              'Deceased',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 10, bottom: 10),
                            child: Text(
                              placeData == null ? '0' : "${placeData[3][5]}",
                              style: TextStyle(
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              placeData == null ? '0' : "${placeData[3][2]}",
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 30, bottom: 10),
                            child: Text(
                              placeData == null ? '0' : "${placeData[3][4]}",
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Text(
                          'Across India',
                          style: TextStyle(
                            fontFamily: 'Monterrsat',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Confirmed',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Recovered',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Deceased',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 0, bottom: 0),
                            child: Text(
                              "${ind_tot}",
                              style: TextStyle(
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 0, right: 3),
                            child: Text(
                              '${ind_rec}',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, right: 4, bottom: 0),
                            child: Text(
                              '${ind_ded}',
                              style: TextStyle(
                                color: Colors.blueGrey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                child: Text(
                  'State/UT',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                child: Text(
                  'Confirmed',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Recovered',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, right: 30, bottom: 10),
                child: Text(
                  'Deaths',
                  style: TextStyle(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ListCheck(),
            ),
          )
        ],
      ),
    );
  }
}
