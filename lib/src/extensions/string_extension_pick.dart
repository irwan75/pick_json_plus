import '../pick_json_base.dart';
import '../pick_json_exception.dart';

extension StringExtensionPick on Pick {
  String get asStringorThrow {
    try {
      if (value != null) {
        return value;
      }
      throw NullValueException(message: 'field $keys: is null');
    } catch (e) {
      if (e is NullValueException) {
        rethrow;
      } else {
        throw WrongFormatException(message: 'field $keys: is not String');
      }
    }
  }

  String? get asStringorNull {
    try {
      return value;
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not String');
    }
  }

  String get asStringorInitialValue {
    try {
      if (value != null) {
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
            message: 'field $keys: initial value is not String');
      }
    }
  }
}
