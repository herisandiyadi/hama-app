class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class MessageException implements Exception {
  final String message;

  MessageException(this.message);
}
