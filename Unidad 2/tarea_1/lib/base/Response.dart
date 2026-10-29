class AppResponse<T> {
  final T data;
  final bool isMock;
  final String? message;

  AppResponse({required this.data, this.isMock = false, this.message});
}
