abstract class Result<T> {
  factory Result.success(T data) = Success;
  factory Result.failure(String message) = Failure;
}

class Success<T> implements Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> implements Result<T> {
  final String message;
  Failure(this.message);
}
