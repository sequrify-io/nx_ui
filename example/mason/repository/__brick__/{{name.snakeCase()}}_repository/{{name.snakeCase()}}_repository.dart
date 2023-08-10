import 'package:{{{fullPath}}}/repositories/{{name.snakeCase()}}_repository/models/{{model_name.snakeCase()}}_model.dart';
import 'package:{{{fullPath}}}/repositories/repository_interface.dart';

class {{name.pascalCase()}}Repository implements RepositoryInterface<{{model_name.pascalCase()}}Model>{
  {{name.pascalCase()}}Repository();

  @override
  Future<List<{{model_name.pascalCase()}}Model>> getAll() async {
    // TODO implement {{name.pascalCase()}}Repository.getAll()
    throw UnimplementedError();
  }

  @override
  Future<{{model_name.pascalCase()}}Model> get(dynamic id) async {
    // TODO implement {{name.pascalCase()}}Repository.getAll()
    throw UnimplementedError();
  }

  @override
  Future<void> add({{model_name.pascalCase()}}Model name) async {
    // TODO implement {{name.pascalCase()}}Repository.add()
    throw UnimplementedError();
  }

  @override
  Future<void> update({{model_name.pascalCase()}}Model name) async {
    // TODO implement {{name.pascalCase()}}Repository.update()
    throw UnimplementedError();
  }

  @override
  Future<void> remove({{model_name.pascalCase()}}Model name) async {
    // TODO implement {{name.pascalCase()}}Repository.remove()
    throw UnimplementedError();
  }

  @override
  Future<void> removeAll() async {
    // TODO implement {{name.pascalCase()}}Repository.removeAll()
    throw UnimplementedError();
  }
}
