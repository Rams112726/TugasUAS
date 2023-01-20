import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listdata = [];
  Future _getdata() async {
    try {
      final respone =
          await http.get(Uri.parse('http://localhost/tugas_uas/read.php'));
      if (respone.statusCode == 200) {
        // print(respone.body);
        final data = jsonDecode(respone.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    // print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: _listdata.length,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              // title: Text("data"),
              title: Text(_listdata[index]['nama']),
              //  subtitle: Text(_listdata[index]['alamat']),
            ),
          );
        }),
      ),
    );
  }
}
