import 'package:hive_flutter/adapters.dart';
part 'repository_hive_model.g.dart';

@HiveType(typeId: 1)
class RepositroyHive {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? imageUrl;
  @HiveField(3)
  String? user;
  @HiveField(4)
  String? starCount;

  RepositroyHive({
    this.title,
    this.description,
    this.imageUrl,
    this.user,
    this.starCount,
  });
}
