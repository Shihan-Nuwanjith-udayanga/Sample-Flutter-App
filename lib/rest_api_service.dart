import 'dart:convert';

import 'package:ui_design_class/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService{
  String apiUrl = 'https://mocki.io/v1/ed0c6388-7a27-4c27-942b-f1b6b358178e';

  // Future method to Get all users from API url ........(response or error)
  Future<List<User>> getUsers() async{
     final response = await http.get(Uri.parse(apiUrl));

     print(response.body);

     // checking the response using status code is successful or not
     if(response.statusCode == 200){
       return getUsersList(response.body);
     }else{
       throw Exception('Unable to fetch data');
     }
  }

  // Convert response body -> User object list
  List<User>getUsersList(String responseBody){
    final parsedBody = json.decode(responseBody).cast<Map<String , dynamic>>();
    return parsedBody.map<User>((json)=>User.fromJson(json)).toList();
  }
}