import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ijandula/models/email_response.dart';

class EmailProvider extends ChangeNotifier {

  List<ResultEmail> resultados = [];

  EmailProvider(){ 
    print("EmailProvider inicializado");
    this.getEmailData();
  }

  Future<String> _getJsonData() async{
    
    final url = Uri.parse('https://opensheet.vercel.app/1KwR6799de-qtIDu-1jUc_Yz3Q0RbMqzJ1T-2nqtO2ek/users');

    // Await the http get response, then decode the json-formatted respo
    final response = await http.get(url);

    return response.body;
  }

  getEmailData() async{
    
    final jsonData = await this._getJsonData();
   
    final emailData = EmailResponse.fromJson('{"results":'+jsonData+'}');

    resultados = emailData.results;
    //print(resultados);
    notifyListeners();  
  }
  
}