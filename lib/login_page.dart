import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_design_class/home_page.dart';

import 'new_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        leading: Icon(
          Icons.account_balance,
          color: Colors.white,
        ),
      ),
      /*body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 2.0,
                spreadRadius: 3.0
              )
            ]
          ),
          width: 200,
          height: 100,
          child: Center(
            // child: Text( 'Login Page', style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            // ),
            // child: Image.network('https://www.pngkey.com/png/full/529-5291672_sample-logo-png-transparent-background.png'),
            child: Image.asset('assets/academic logo.jpeg'),
          )
      ),*/
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text('Login', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                  )
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 300,
                child: Image.network('https://www.pngkey.com/png/full/529-5291672_sample-logo-png-transparent-background.png'),
              ),
              // ====== Input text form fields ( Username, Password.............)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (value){
                          print(value);
                        },
                        controller: _usernameController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your username',
                            hintText: 'Username'
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        onChanged: (value){
                          print(value);
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your password',
                            hintText: 'Username'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ===================== Login Button =========
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    loginButtonClick();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Login', style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  void loginButtonClick()
  {
    if(_usernameController.text == 'user123' && _passwordController.text == '1234')
      {
        print('Login success');
        Navigator.push(
          context,
          // MaterialPageRoute(builder: (context) => HomePage(username: _usernameController.text,password: _passwordController.text,)),
          MaterialPageRoute(builder: (context) => NewHomePage( )),
        );
      }else{
        print('Login Fail');
        showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context)
  {
    Widget okButton = ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text(
      'OK'
    ));

    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Wrong Username and Password'),
      actions: [
        okButton
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
}
