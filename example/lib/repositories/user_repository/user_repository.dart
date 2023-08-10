import 'package:isar/isar.dart';
import 'package:example/repositories/repository_interface.dart';
import 'package:example/repositories/user_repository/models/user_model.dart';

// TODO (ak) needs some rearchitecturing
class UsersRepository implements RealTimeRepositoryInterface<User> {
  UsersRepository(this._collection);

  final IsarCollection<User> _collection;

  // READ
  @override
  Stream<User> get(id) async* {
    yield* _collection.where().idEqualTo(id).watch().map((event) => event.first);
  }

  @override
  Stream<List<User>> getAll() async* {
    yield* _collection.where().watch(fireImmediately: true);
  }

  // WRITE
  @override
  Future<void> add(User user) async {
    await _collection.put(user);
  }

  @override
  Future<void> remove(User user) async {
    await _collection.delete(user.id);
  }

  @override
  Future<void> removeAll() async {
    await _collection.clear();
  }

  @override
  Future<void> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
