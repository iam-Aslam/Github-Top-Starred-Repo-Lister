import 'package:flutter/material.dart';
import 'package:githubapi/controllers/repo_provider.dart';
import 'package:githubapi/models/repository_hive_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'views/home/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RepositroyHiveAdapter());
  await Hive.openBox<RepositroyHive>('repositories');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepositoryProviderModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Github Most Starred Repositories',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
