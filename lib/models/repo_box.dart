import 'package:githubapi/models/repository_hive_model.dart';
import 'package:hive/hive.dart';

class RepositoryBox {
  static Box<RepositroyHive>? _box;

  static Box<RepositroyHive> getInstance() {
    return _box ??= Hive.box<RepositroyHive>('repositories');
  }
}
