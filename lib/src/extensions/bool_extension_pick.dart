import '../pick_json_base.dart';
import '../pick_json_exception.dart';

extension BoolExtensionPick on Pick {
  bool get asBoolorThrow {
    try {
      if (value != null && value is bool) {
        return value;
      }
      throw NullValueException(message: 'field $keys: is not bool');
    } catch (e) {
      if (e is NullValueException) {
        rethrow;
      } else {
        throw WrongFormatException(message: 'field $keys: is not bool');
      }
    }
  }

  bool? get asBoolorNull {
    try {
      if (value != null && value is bool) {
        return value;
      }
      return null;
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not bool');
    }
  }

  bool get asBoolorInitialValue {
    try {
      if (value != null && value is bool) {
        return value;
      }
      if (initialValue != null) {
        return initialValue;
      }
      throw WrongInitialValueException(
          message: 'field $keys: initial value is null');
    } catch (e) {
      if (e is WrongInitialValueException) {
        rethrow;
      } else {
        throw WrongFormatException(
            message: 'field $keys: initial value is not bool');
      }
    }
  }
}
