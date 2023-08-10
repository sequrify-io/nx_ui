
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{model_name.snakeCase()}}_model.freezed.dart';
part '{{model_name.snakeCase()}}_model.g.dart';

@freezed
class {{model_name.pascalCase()}}Model with _${{model_name.pascalCase()}}Model {
  const {{model_name.pascalCase()}}Model._();
  factory {{model_name.pascalCase()}}Model({
    required String property1,
    @Default('') String property2,
  }) = _{{model_name.pascalCase()}}Model;

  factory {{model_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{model_name.pascalCase()}}ModelFromJson(json);

  @override
  String toString() => toJson().toString();
}
