import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_design_class/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/academic logo.jpeg'),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement( context,
                  MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                );
              },
              child: Text('Push and remove until'),
            ),
          )
        ],
      )
    );
  }
}
