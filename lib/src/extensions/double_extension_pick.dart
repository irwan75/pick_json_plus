import '../pick_json_base.dart';
import '../pick_json_exception.dart';

extension DoubleExtensionPick on Pick {
  double get asDoubleorThrow {
    try {
      return double.parse(value.toString());
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not double');
    }
  }

  double? get asDoubleorNull {
    try {
      return double.tryParse(value.toString());
    } catch (e) {
      throw WrongFormatException(message: 'field $keys: is not double');
    }
  }

  double get asDoubleorInitialValue {
    try {
      final data = double.tryParse(value.toString());
      if (data != null) {
        return data;
      }
      if (initialValue != null) {
        return double.parse(initialValue.toString());
      }
      throw WrongInitialValueException(
          message: 'field $keys: initial value is null');
    } catch (e) {
      if (e is WrongInitialValueException) {
        rethrow;
      } else {
        throw WrongFormatException(
            message: 'field $keys: initial value is not double');
      }
    }
  }
}
