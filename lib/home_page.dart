import 'package:flutter/material.dart';
import 'package:ui_design_class/login_page.dart';
import 'package:ui_design_class/splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen() ));
              Navigator.pushReplacement( context,
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              );
            },
            child: Text('Log Out'),
          ),
        ),
      ),
    );
  }
}
