import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState(); //Run the original function we are overriding inside here

    getData();
  }

  getData()async{
    String theUrl = 'https://jsonplaceholder.typicode.com/posts';
    var response = await get(Uri.parse(theUrl),headers: {"Accept":"application/json"});

    var responseBody = jsonDecode(response.body);
    print('${responseBody[0]['title']}');

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter HTTP GET';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot){
          List snapData = snapshot.data;

          ConnectionState conn = snapshot.connectionState;

          if(conn == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return ListView.builder(
            itemCount: snapData.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text('${snapshot.data[index]['title']}'),
                subtitle: Text('${snapshot.data[index]['body']}')
              );
            }
          );
        },
      )
    );
  }
}
