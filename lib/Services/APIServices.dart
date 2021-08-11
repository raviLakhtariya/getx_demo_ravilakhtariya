
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
//import 'package:get/get.dart';

enum DioErrorType { connectTimeout, sendTimeout, receiveTimeout, response, cancel, other, }

class APIServices {
  final Dio dio = Dio();




  Future<dynamic> get(@required String url/*, Function(dynamic data) onSuccess, Function(dynamic error) onError,*/) async {
    print('Api Get, url $url');
    var uri = Uri.parse(url);

    var responseJson;
    try {
      Response? response = await dio.getUri(uri);
      // responseJson = _returnResponse(response);
      return response.data;
    } on DioError catch (e) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        //throw CommunicationTimeoutException("Server is not reachable. Please verify your internet connection and try again");
      } else if (DioErrorType.response == e.type) {
        // 4xx 5xx response
        // throw exception...
      } else if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          //throw CommunicationTimeoutException('No Internent');
        }
      } else {
        //throw CommunicationException("Problem connecting to the server. Please try again.");
      }
      print('api get recieved!');
      return responseJson;
    }
  }


  Future<dynamic> post(@required String url, @required Map<String, dynamic>? body) async {
    print('Api Get, url $url');
    var uri = Uri.parse(url);

    var responseJson;
    try {
      Response? response = await dio.postUri(uri,data: body);
      if(response.statusCode == 200){
        //if (onSuccess != null) onSuccess(response.data);
        return response.data;
      }
       //_returnResponse(response);
    } on DioError catch (e) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        return e.message;
      } else if (DioErrorType.response == e.type) {
        return e.message;
      } else if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          return e.message;
        }
      } else {
          return e.message;
      }
      print('api get recieved!');
      return responseJson;
    }
  }

 /* void _returnResponse(Response? response,  Function(dynamic data) onSuccess, Function(dynamic error) onError,) {
      switch (response!.statusCode) {
        case 200:
          if (onSuccess != null) onSuccess(response.data);
          break;
         //  var responseJson = json.decode(response!.data.toString());
          // print(responseJson);
         // return [true, responseJson];

        case 400:

          //Get.rawSnackbar(message: "Error : ${response!.data}");
         // return [false, response!.data.toString()];
          if (onError != null) onError(false);
          break;
        case 401:
        case 403:
          //Get.rawSnackbar(message: "Error : ${response!.data}");
          //return [false, response!.data.toString()];
        if (onError != null) onError(false);
        break;
        case 500:
        default:
          //Get.rawSnackbar(message: "Error : ${response.statusCode}");
          //return [false, response!.data.toString()];
        if (onError != null) onError(false);
        break;
      }
    }*/
  }

