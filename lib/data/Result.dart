class Result<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  Result.success(this.data)
      : errorMessage = null,
        isSuccess = true;

  Result.failure(this.errorMessage)
      : data = null,
        isSuccess = false;
}
