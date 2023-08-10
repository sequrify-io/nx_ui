import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:example/providers/isar_provider.dart';
import 'package:example/repositories/user_repository/models/user_model.dart';
import 'package:example/repositories/user_repository/user_repository.dart';

final usersRepositoryProvider = FutureProvider.autoDispose((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return UsersRepository(isar.users);
});

final userProvider = StreamProvider.autoDispose.family<User?, int>((ref, userId) async* {
  final userRepository = await ref.watch(usersRepositoryProvider.future);
  yield* userRepository.get(userId);
});

final usersProvider = StreamProvider.autoDispose<List<User>>((ref) async* {
  final usersRepository = await ref.watch(usersRepositoryProvider.future);
  yield* usersRepository.getAll();
});
