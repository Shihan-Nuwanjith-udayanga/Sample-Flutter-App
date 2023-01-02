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
  List<String> data = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
            Expanded(
              child: ListView.separated(
                // scrollDirection: Axis.horizontal,

                itemCount: data.length,
                separatorBuilder: (context, index){
                  return Container(color: Colors.grey, height: 1,);
                },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue
                      ),
                      child: Center(
                        child: Text( data[index], style: TextStyle(
                            color: Colors.white
                        )),
                      ),
                    );
                  },
              )
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
