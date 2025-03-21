class Status {
  final StatusType type;
  final dynamic errorData;

  Status(this.type, [this.errorData]);

  static Status initial = Status(StatusType.initial);
  static Status loading = Status(StatusType.loading);
  static Status success = Status(StatusType.success);
  static Status empty = Status(StatusType.empty);
  static Status internetFailure = Status(StatusType.internetFailure);
  static Status serverFailure = Status(StatusType.serverFailure);
  static Status apiFailure(dynamic errorData) => Status(StatusType.apiFailure, errorData);
}

enum StatusType {
  initial,
  loading,
  success,
  empty,
  internetFailure,
  serverFailure,
  apiFailure,
}
