import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:{{{fullPath}}}/repositories/{{name.snakeCase()}}_repository/{{name.snakeCase()}}_repository.dart';

final {{name.lowerCase()}}RepositoryProvider = FutureProvider((ref) async => {{name.pascalCase()}}Repository());
