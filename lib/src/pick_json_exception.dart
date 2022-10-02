class PickJsonException implements Exception {
  final String message;
  const PickJsonException({
    required this.message,
  });

  @override
  String toString() => message;
}

class NullValueException extends PickJsonException {
  NullValueException({required String message})
      : super(message: "NullValueException: $message");
}

class WrongFormatException extends PickJsonException {
  WrongFormatException({required String message})
      : super(message: "WrongFormatException: $message");
}

class WrongInitialValueException extends PickJsonException {
  WrongInitialValueException({required String message})
      : super(message: "WrongInitialValueException: $message");
}
