sealed class AppState {}

final class Initial extends AppState {}

final class Loading extends AppState {}

final class Success<T> extends AppState {
  late T data;
  Success(this.data);
}

final class ApiFailure extends AppState {
  final dynamic error;
  ApiFailure(this.error);
}

final class InternetError extends AppState {}

final class ServerError extends AppState {}
