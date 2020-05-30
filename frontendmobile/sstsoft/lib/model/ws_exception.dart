class WsException implements Exception{
  final int httpErrorCode;
  final dynamic cause;
  const WsException(this.httpErrorCode, this.cause);
}