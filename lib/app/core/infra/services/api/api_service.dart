import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../domain/errors/api_exception.dart';
import '../../../util/utils.dart';

part 'api_service.g.dart';

enum HttpMethod {
  POST,
  GET,
  PUT,
  PATCH,
  DELETE,
}

@Injectable()
class ApiService {
  final Dio dio;
  final String baseUrl = 'https://api.dictionaryapi.dev/api/v2';
  ApiService(this.dio);

  Future<Response> requestApi({
    required HttpParams params,
  }) async {
    try {
      Map<String, dynamic> headers = params.headers ??
          {
            'content-type': 'application/json',
            'accept': '*/*',
          };

      Response response = await dio.request(
        baseUrl + params.uri,
        data: params.body,
        queryParameters: params.queryParameters,
        options: Options(
          method: params.requestMethod,
          headers: headers,
          responseType: ResponseType.json,
        ),
      );

      return response;
      // ignore: deprecated_member_use
    } on DioError catch (exception, stackTrace) {
      var error = RequestError.fromDioError(exception);

      throw ApiException(
        error.message!,
        error.statusCode!,
        error.tokenExpired!,
        exception: exception,
        stackTrace: stackTrace,
      );
    }
  }
}

class HttpParams {
  final String uri;
  final HttpMethod httpMethod;
  final Map<String, dynamic>? headers;
  final dynamic body;
  final Map<String, dynamic>? queryParameters;

  HttpParams({
    required this.uri,
    required this.httpMethod,
    this.headers,
    this.body,
    this.queryParameters,
  });

  String get requestMethod {
    if (httpMethod == HttpMethod.GET) {
      return 'GET';
    } else if (httpMethod == HttpMethod.POST) {
      return 'POST';
    } else if (httpMethod == HttpMethod.PUT) {
      return 'PUT';
    } else if (httpMethod == HttpMethod.PATCH) {
      return 'PATCH';
    } else if (httpMethod == HttpMethod.DELETE) {
      return 'DELETE';
    } else {
      return 'NO_METHOD';
    }
  }
}

class RequestError {
  String? message;
  int? statusCode;
  bool? tokenExpired;

  // ignore: deprecated_member_use
  RequestError.fromDioError(DioError requestError) {
    try {
      if (Utils.isNullOrEmpty(requestError.response)) {
        statusCode = 502;
        message = Utils.returnDefaultStringIfNullOrEmpty(
            requestError.error, 'No error message');
      } else {
        statusCode = Utils.returnDefaultIntIfNullOrEmpty(
            requestError.response!.statusCode, 500);
        message = Utils.returnDefaultStringIfNullOrEmpty(
            requestError.response!.data['message'], 'No error message');
      }
      tokenExpired = statusCode == 401 ? true : false;
    } catch (e) {
      message = 'No error message';
      statusCode = statusCode ?? 500;
      tokenExpired = statusCode == 401 ? true : false;
    }
  }
}
