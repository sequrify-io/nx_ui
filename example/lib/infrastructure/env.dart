import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_URL', defaultValue: '')
  static final apiUrl = _Env.apiUrl;
}
