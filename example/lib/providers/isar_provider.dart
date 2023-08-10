import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:example/repositories/user_repository/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

final isarSchemas = [
  UserSchema,
];

final isarProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();

  return await Isar.open(
    isarSchemas,
    directory: dir.path,
  );
});
