sealed class AppState {}

final class Initial extends AppState {}

final class Loading extends AppState {}

final class Success extends AppState {}

final class Failed extends AppState {}

final class InternetError extends AppState {}

final class ServerError extends AppState {}
