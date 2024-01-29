import 'package:dio/dio.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/dio/dio_wrapper.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

List noErrorEndpointTags = ['app_usage_metric'];

class MetaDio {
  static final MetaDio _singleton = MetaDio._internal();

  bool showNetworkLogs =  true;
  String token="";
  factory MetaDio() {
    return _singleton;
  }
  MetaDio._internal();

  Dio _dio = Dio(BaseOptions(
    baseUrl:  ( kReleaseMode ? MetaFlavourConstants.prodUrl : MetaFlavourConstants.devUrl) + MetaFlavourConstants.apiVersion,
    connectTimeout:const Duration(seconds: 45), // 45 secs
    receiveTimeout:const Duration(seconds: 45), // 5 secs Note: This is not the receiving time limitation. Only Error.
  ));

  getWrapper(){
    return MetaDioWrapper(_dio);
  }

  setDio()   {

    _dio =  addInterceptors(_dio);

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          // Handle trial version patient app
          return handler.next(options);
        }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
      // Do something with response data
      print("=========> RESPONSE SUCCESS");
      return handler.next(response);
    }, onError: (DioException e, ErrorInterceptorHandler handler) async {
      // Do something with response error
      print("=========> RESPONSE ERRROR");
      if (!shouldShowError(e.requestOptions.path)) {
        return handler.next(e);
      }
      if (e.response == null && shouldShowError(e.requestOptions.path)) {
        MetaAlert.showErrorAlert(
          title: 'Network Failure',
          message: 'Please check your network connectivity!',
        );
      }
      return handler.next(e);
    }));

    //addHeaders();

    return MetaDioWrapper(_dio);
  }

  Dio addPrettyInterceptors(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        canShowLog: true,
        // logPrint: dio.
      ),
    );
    return dio;
  }

    addInterceptors(Dio dio) {

    if (showNetworkLogs) {
       _dio = addPrettyInterceptors(_dio);
        print("added PrettyInterceptors");
     }

    print("HEADERS : "+ dio.options.headers.toString() );

    return dio;
  }

  // addHeaders() {
  //   print("Adding headers");
  //
  //   options!.headers = {
  //       'Accept': 'application/json',
  //     };
  //
  //     if (authTokens != null && authTokens.isNotEmpty) {
  //     options!.headers = {
  //         'Authorization': 'Bearer $authTokens',
  //         'Accept': 'application/json',
  //       };
  //     }
  // }

  Options getOptions() {
    //if (MetaFlavourConstants.accessToken != null && MetaFlavourConstants.accessToken.isNotEmpty) {

      return Options(
          headers:{
              'Authorization': 'Bearer ${MetaHiveConfig().getHive(StringConstants.accessToken)}',
              'Accept': 'application/json'
          }) ;

    //}

    return Options(headers:{
      'Accept': 'application/json'
    } ) ;
  }

  Options getMultipartOptions() {
    return Options(headers:{
      'Authorization': 'Bearer ${MetaHiveConfig().getHive(StringConstants.accessToken)}',
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
    } ) ;
  }


  bool shouldShowError(String url) {
    for (var tag in noErrorEndpointTags) {
      if (url.contains(tag)) return false;
    }
    return true;
  }

}
