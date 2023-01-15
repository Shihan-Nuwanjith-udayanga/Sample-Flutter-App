import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ui_design_class/rest_api_service.dart';
import 'package:ui_design_class/user.dart';
import 'package:ui_design_class/user_screen.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

  final apiService = RestAPIService();

  List<User> usersList = <User>[];

  List<bool> favouriteStatusList = [];

  List<User> favouriteUsersList = [];

  late Icon favouriteIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // apiService.getUsers();
    apiService.getUsers().then((value){

     /* setState((){
        usersList=value;
      });*/

      if(value.isNotEmpty){
        for(User user in value){
          favouriteStatusList.add(false);
        }
      }

    });

    favouriteIcon = Icon(Icons.favorite_border, color: Colors.red,);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future: apiService.getUsers(),
              builder: (context , snapShot){
                if(snapShot.hasData){
                  return ListView.builder(
                    // itemCount: snapShot.data.length,
                    itemBuilder: (context , index){
                      // return Container( margin: EdgeInsets.all(8), height:50 , width: 200, color: Colors.blue);
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(
                            user: snapShot.data![index],
                          )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: Colors.grey.withOpacity(0.3)
                              )
                            ]
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: ListTile(
                            title: Text(snapShot.data![index].name ?? '', style: TextStyle(fontSize: 18, color: Colors.black),),
                            subtitle: Text(snapShot.data![index].city ?? '', style: TextStyle(fontSize: 18, color: Colors.black),),
                            leading: ClipOval(
                              child: Image.network(snapShot.data![index].image, fit: BoxFit.cover, width: 60, height: 60,),
                            ),
                            trailing: IconButton(
                              icon: getFavouriteIcon(index),
                              onPressed: () {
                                setState(() {
                                  favouriteStatusList[index] = !favouriteStatusList[index];

                                  if(favouriteUsersList.contains(snapShot.data![index])){
                                    favouriteUsersList.remove(snapShot.data![index]);
                                    print("Remove");
                                  }else{
                                    favouriteUsersList.add(snapShot.data![index]);
                                    print("Add");
                                  }

                                });

                                /*for(var item in favouriteUsersList){
                                  print(item.name);
                                }*/
                                
                              } ,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }else{
                  /*return Container(
                    child: Center(
                      child: Text('Loading...', style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                    ),
                  );*/
                  // ================ Create a loading progress bar using flutter spinkit =======
                  return Container(
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.orange,
                      ),
                    ),
                  );
                }
              },
            ))

            // ========= List View using without future builder method. ===========
           /*
            Expanded(child: ListView.builder(
              itemCount: usersList.length ?? 0,
              itemBuilder: (context, index){
                if(usersList != null && usersList.isNotEmpty){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(
                        user: usersList[index],
                      )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 3,
                                color: Colors.grey.withOpacity(0.3)
                            )
                          ]
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ListTile(
                        title: Text(usersList[index].name ?? '', style: TextStyle(fontSize: 18, color: Colors.black),),
                        subtitle: Text(usersList[index].city ?? '', style: TextStyle(fontSize: 18, color: Colors.black),),
                        leading: ClipOval(
                          child: Image.network(usersList[index].image, fit: BoxFit.cover, width: 60, height: 60,),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {  } ,
                        ),
                      ),
                    ),
                  );
                }else{
                  return Container(
                    child: Center(
                      child: Text('Loading...', style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                    ),
                  );
                }
              }
            ))*/
          ],
        ),
      ),
    );
  }

  Icon getFavouriteIcon(int index){
    if(favouriteStatusList[index]){
      return Icon(Icons.favorite, color: Colors.red,);
    }else{
      return Icon(Icons.favorite_border, color: Colors.red,);
    }
  }
}
