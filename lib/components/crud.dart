import 'dart:convert' ;
import 'package:http/http.dart' as http;

class Crud{
  getRequest (String usrl)async {
    try{
      var reponse = await http.get(Uri.parse(usrl));
      if(reponse.statusCode == 200){
        var responsebody = jsonDecode(reponse.body);
        return responsebody;
      }else{
        return "failed ${reponse.statusCode}";
      }

    }
    catch(e){
      print("error $e");
    }
  }
  postRequest (String usrl,Map data)async {
    try{
      var reponse = await http.post(Uri.parse(usrl),body: data);
      if(reponse.statusCode == 200){
        var responsebody = jsonDecode(reponse.body);

        return responsebody;
      }else{
        return "failed ${reponse.statusCode}";
      }

    }
    catch(e){
      print("error $e");
    }
  }
}