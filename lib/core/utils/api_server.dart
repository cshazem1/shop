import 'package:dio/dio.dart';

class ApiServer{

  String baseUrl="https://api.escuelajs.co/api/v1/";
Dio dio;
  ApiServer({required this.dio});
Future<dynamic> get(String endPoint) async {
  var response= await dio.get('$baseUrl$endPoint');
return response.data;
}




}