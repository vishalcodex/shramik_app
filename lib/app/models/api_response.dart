enum Status {
  INITIAL,
  LOADING,
  COMPLETED,
  ERROR,
}

enum Error { DATA_FETCH_ERROR, TIME_OUT_ERROR, INVALID_ROUTE, INVALID_REQUEST }

class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  Error? error;

  ApiResponse.initial(this.message) : status = Status.INITIAL;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message, this.error) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
