import 'package:dio/dio.dart';
import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/dio/dio_client.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class BaseDioWrapper {
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    bool showLoader,
    bool enableBearer,
    String loadingMessage,
  });

  Future<Response<T>> post<T>(
    String path, {
    data, //jsonBody
    Map<String, dynamic> queryParameters, //PathParams
    Options options, //headers- Authorization
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    bool showLoader, // loader
    bool showAlert, // alert
    bool enableBearer, //Tokens
    String loadingMessage, //message
  });

  // Future<Response> getUri(
  //     Uri uri, {
  //       Options options,
  //       CancelToken cancelToken,
  //       ProgressCallback onReceiveProgress,
  //       bool showLoader,
  //       String loadingMessage,
  //     });

  Future<Response> patch(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    bool showLoader,
    String loadingMessage,
  });

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    bool showLoader,
    bool enableBearer,
    String loadingMessage,
  });

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    bool showLoader,
    String loadingMessage,
    bool enableBearer,
  });
}

class MetaDioWrapper implements BaseDioWrapper {
  final Dio _dio;

  MetaDioWrapper(this._dio);

  void showHUD({required String? message}) {
    MetaProgressHUD.showLoading(text: message.toString().tr());
  }

  void hideHUD() {
    MetaProgressHUD.dismiss();
  }

  void showErrorHUD({required String message}) {
    MetaProgressHUD.showErrorAndDismiss(text: message.tr());
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool showLoader = false,
    bool enableBearer = true,
    String? loadingMessage,
  }) async {
    if (showLoader) showHUD(message: loadingMessage);

    if (!enableBearer) {
      options ??= Options();
    } else {
      options ??= MetaDio().getOptions();
    }

    print("options");
    print(options.headers);

    try {
      Response<T> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      var dataMap;
      try {
        dataMap = response.data as Map<String, dynamic>;
      } catch (e) {
        dataMap = response.data as List;
      }

      try {
        MetaAlert.showSuccessAlert(
          message: dataMap["message"],
        );
      } catch (e) {
        print("Model ERROR RESPONSE===========> ");
      }

      return response;
    } on DioException catch (e) {
      print("PARSE ERROR RESPONSE===========> ${e.response}");
      parseErrorResponse(e);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      return Response(data: e as T, requestOptions: RequestOptions());
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? showLoader = true,
    bool showAlert = false,
    bool? enableBearer = true,
    String? loadingMessage,
  }) async {
    // print("Data is ................."+data);
    if (showLoader!) showHUD(message: loadingMessage);

    if (!enableBearer!) {
      options ??= Options();
    } else {
      options ??= MetaDio().getOptions();
    }

    try {
      Response<T> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // var (bool,responseData) = _response(response);
      //
      // if()

      try {
        Map<String, dynamic> dataMap = response.data as Map<String, dynamic>;
        if (showAlert) {
          MetaAlert.showSuccessAlert(
            message: dataMap["message"],
          );
        }
      } catch (e) {
        print("Model ERROR RESPONSE===========> ");
        return response;
      }

      return response;
    } on DioException catch (e) {
      print("PARSE ERROR RESPONSE===========> ${e.response}");
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      return Response(data: e as T, requestOptions: RequestOptions());
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? showLoader = true,
    String? loadingMessage,
  }) async {
    if (showLoader!) showHUD(message: loadingMessage);
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? showLoader = true,
    bool? enableBearer = false,
    String? loadingMessage,
  }) async {
    if (showLoader!) showHUD(message: loadingMessage);
    if (!enableBearer!) {
      options ??= Options();
    } else {
      options ??= MetaDio().getOptions();
    }

    try {
      Response<T> response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      try {
        Map<String, dynamic> dataMap = response.data as Map<String, dynamic>;
        MetaAlert.showSuccessAlert(
          message: dataMap["message"],
        );
      } catch (e) {
        print("Model ERROR RESPONSE===========> ");
        return response;
      }

      return response;
    } on DioException catch (e) {
      print("PARSE ERROR RESPONSE===========> " + e.response.toString());
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  @override
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool? showLoader = true,
    String? loadingMessage,
    bool enableBearer = false,
  }) async {
    if (showLoader!) showHUD(message: loadingMessage);

    if (!enableBearer) {
      options = Options();
    } else {
      if (options == null) {
        options = MetaDio().getOptions();
      }
    }
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      parseErrorResponse(e);
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } catch (e) {
      // Logger.captureException(e, stackTrace: stackTrace);
      rethrow;
    } finally {
      if (showLoader) hideHUD();
    }
  }

  // @override
  // Future<Response> getUri(
  //     Uri uri, {
  //       Options? options,
  //       CancelToken? cancelToken,
  //       ProgressCallback? onReceiveProgress,
  //       bool? showLoader = false,
  //       String? loadingMessage,
  //     }) async {
  //   if (showLoader!) showHUD(message: loadingMessage);
  //   try {
  //     final response = await _dio.getUri(
  //       uri,
  //       options: options,
  //       cancelToken: cancelToken,
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     return response;
  //   } on DioException catch (e, stackTrace) {
  //     parseErrorResponse(e);
  //     if (showLoader) hideHUD();
  //   }
  // }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return (true, response);
      case 401:
      case 400:
      case 403:
      case 422:
      case 404:
      case 500:
        return (false, response);
      // throw AuthException(
      //     response.statusCode, StringConstants.somethingWentWrong);
      default:
        return (false, response);
    }
  }

  void parseErrorResponse(DioException e) async {
    // if (ignoreStatusCodes.contains(e.response!.statusCode)) {
    //   return;
    // }
    String errorMessage = e.response!.data['message'];
    print("parseBadRequestError : $errorMessage");
    if (errorMessage.isEmpty || errorMessage == "") {
      MetaAlert.showErrorAlert(
        title: "MetaStringConstants.serverError",
        message: "MetaStringConstants.somethingWentwrong",
      );
    } else {
      MetaAlert.showErrorAlert(
        message: errorMessage,
      );
    }
  }

  static String parseBadRequestError(dynamic errorObj) {
    Map errors = {};
    String errorMessage = "";
    try {
      if (errorObj is Map) {
        errorObj.forEach((k, v) {
          print('${k}: ${v}');
          if (v is String) {
            errorMessage += "${k}: ${v} \n";
          } else if (v is List) {
            errorMessage += "${k}: ${v.join(",")} \n";
          }
        });
      } else if (errorObj is List) {
        errorObj.forEach((v) {
          if (v is String) {
            errorMessage += "${v} \n";
          } else if (v is List) {
            errorMessage += "${v.join(",")} \n";
          }
        });
      } else if (errorObj is String) {
        errorMessage = errorObj;
      }
    } catch (e) {
      // Do nothing
    }

    if (errorMessage.isEmpty) {
      errorMessage = "Invalid Request!";
    }
    return errorMessage;
  }
}
