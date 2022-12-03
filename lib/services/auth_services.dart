import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../constants/service.dart';
import '../models/admin.dart';
import '../models/error.dart';

abstract class AuthServices {
  static Future<Either<Admin, ErrorResponse>> login(
      String username, String password) async {
    Response response;
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      response = await dio.post(
        "/api/admin/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        return Left(Admin.fromJson(response.data));
      } else {
        return Right(ErrorResponse.fromJson(response.data));
      }
    } catch (e) {
      if (e is DioError) {
        return Right(ErrorResponse.fromJson(e.response!.data));
      } else {
        throw Exception(e.toString());
      }
    }
  }

  static Future<int> logout() async {
    try {
      final dio = Dio(BaseOptions(baseUrl: baseUrl));
      var response = await dio.post("/api/admin/logout");
      // await StorageServices.deleteToken("jwt-token");
      // await StorageServices.deleteToken("admin");
      return response.statusCode!;
      // if (response.statusCode == 200) {
      //   await SharedPref.remove("jwt-token");
      // } else {
      //   throw Exception("There is something error");
      // }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

// class DioExceptions implements Exception {
//   DioExceptions.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioErrorType.CANCEL:
//         message = "Request to API server was cancelled";
//         break;
//       case DioErrorType.CONNECT_TIMEOUT:
//         message = "Connection timeout with API server";
//         break;
//       case DioErrorType.DEFAULT:
//         message = "Connection to API server failed due to internet connection";
//         break;
//       case DioErrorType.RECEIVE_TIMEOUT:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioErrorType.RESPONSE:
//         message =
//             _handleError(dioError.response.statusCode, dioError.response.data);
//         break;
//       case DioErrorType.SEND_TIMEOUT:
//         message = "Send timeout in connection with API server";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }

//   String message;

//   String _handleError(int statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request';
//       case 404:
//         return error["message"];
//       case 500:
//         return 'Internal server error';
//       default:
//         return 'Oops something went wrong';
//     }
//   }

//   @override
//   String toString() => message;
// }
