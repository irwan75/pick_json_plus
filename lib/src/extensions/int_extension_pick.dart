import '../pick_json_base.dart';
import '../pick_json_exception.dart';

extension IntExtensionPick on Pick {
  int get asIntorThrow {
    try {
      return int.parse(value.toString());
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not int');
    }
  }

  int? get asIntorNull {
    try {
      return int.tryParse(value.toString());
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not int');
    }
  }

  int get asIntorInitialValue {
    try {
      final data = int.tryParse(value.toString());
      if (data != null) {
        return data;
      }
      if (initialValue != null) {
        return int.parse(initialValue.toString());
      }
      throw WrongInitialValueException(
          message: 'field $keys: initial value is null');
    } catch (e) {
      if (e is WrongInitialValueException) {
        rethrow;
      } else {
        throw WrongFormatException(
            message: 'field $keys: initial value is not int');
      }
    }
  }
}
