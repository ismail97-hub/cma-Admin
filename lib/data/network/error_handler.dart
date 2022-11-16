import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

// internal server error types
const String USER_NOT_FOUND = "User not found";
const String BAD_CREDENTIALS = "Bad credentials";
const String USER_IS_DISABLED = "User is disabled";
const String INDENTIFICATIONS_ERRONEES = "Les identifications sont erronées";
const String OLD_PASSWORDINCORRECT = "Old password is incorrect !!!";


enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    print(error);
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure(
              message: getInternalServerErrorMessage(error.response!.data["message"])
            );
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

String getInternalServerErrorMessage(String message){
  switch (message) {
    case USER_NOT_FOUND:
      return AppStrings.usernameIEM;
    case BAD_CREDENTIALS:
      return AppStrings.passwordIEM;
    case INDENTIFICATIONS_ERRONEES:
      return AppStrings.passwordIEM;
    case USER_IS_DISABLED:
      return AppStrings.accountDisbledIEM;  
    case OLD_PASSWORDINCORRECT:
      return AppStrings.oldPasswordIncorrectError;  
    default:
      return ResponseMessage.INTERNAL_SERVER_ERROR;
  }
}
extension DataSourceExtension on DataSource {
  Failure getFailure({String? message}) {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            message??ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static String SUCCESS = AppStrings.success.tr(); // success with data
  static String NO_CONTENT = AppStrings.noContent.tr(); // success with no content
  static String BAD_REQUEST = AppStrings.badRequestError.tr(); // failure, api rejected our request
  static String FORBIDDEN = AppStrings.forbiddenError.tr(); // failure,  api rejected our request
  static String UNAUTHORISED = AppStrings.unauthorizedError.tr(); // failure, user is not authorised
  static String NOT_FOUND = AppStrings.notFoundError.tr(); // failure, API url is not correct and not found in api side.
  static String INTERNAL_SERVER_ERROR = AppStrings.internalServerError.tr(); // failure, a crash happened in API side.

  // local responses codes
  static String DEFAULT = AppStrings.defaultError.tr(); // unknown error happened
  static String CONNECT_TIMEOUT = AppStrings.timeoutError.tr(); // issue in connectivity
  static String CANCEL = AppStrings.defaultError.tr(); // API request was cancelled
  static String RECEIVE_TIMEOUT = AppStrings.timeoutError.tr(); //  issue in connectivity
  static String SEND_TIMEOUT = AppStrings.timeoutError.tr(); //  issue in connectivity
  static String CACHE_ERROR = AppStrings.defaultError.tr(); //  issue in getting data from local data source (cache)
  static String NO_INTERNET_CONNECTION = AppStrings.noInternetError.tr(); // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
