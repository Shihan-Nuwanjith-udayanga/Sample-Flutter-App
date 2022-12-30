import 'package:flutter/material.dart';
import 'package:ui_design_class/login_page.dart';
import 'package:ui_design_class/splash_page.dart';

class HomePage extends StatefulWidget {

  final String username;
  final String password;

  const HomePage({Key? key, required this.username, required this.password,}) : super(key: key);

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
       /* child: Center(
          child: ElevatedButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen() ));
              Navigator.pushReplacement( context,
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              );
            },
            child: Text('Log Out'),
          ),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child:Center(
                child: Text('Welcome ${widget.username} \nPassword ${widget.password}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Log out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
