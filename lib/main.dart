import 'package:equaze/ui/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "eQuaze Home",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: FutureBuilder(
        future: _getMainEntryPoint(),
        builder: (BuildContext context,AsyncSnapshot<Widget> snapshot){
          return snapshot.data ?? Container(height: 1,width: 1,);
        },
      )
    );
  }

  Future<Widget> _getMainEntryPoint() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    return isLoggedIn ? DashboardPage():LoginPage();
  }

}