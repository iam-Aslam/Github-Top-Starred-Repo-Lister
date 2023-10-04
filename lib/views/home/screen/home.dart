import 'package:flutter/material.dart';
import 'package:githubapi/controllers/repo_provider.dart';
import 'package:githubapi/models/repo_box.dart';
import 'package:githubapi/models/repository_hive_model.dart';
import 'package:githubapi/views/home/widgets/card.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Top Starred Repositories',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // will Refresh the data
            final provider =
                Provider.of<RepositoryProviderModel>(context, listen: true);
            await provider.fetchData();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Consumer<RepositoryProviderModel>(
              builder: (context, provider, _) {
                if (provider.repositories.isEmpty) {
                  provider.fetchData();
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final dataBase = RepositoryBox.getInstance();
                  List<RepositroyHive> list = dataBase.values.toList();
                  return ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      );
                    },
                    itemBuilder: (context, index) {
                      final repository = list[index];
                      return ListCard(
                        title: repository.title!,
                        description: repository.description!,
                        imageUrl: repository.imageUrl!,
                        user: repository.user!,
                        starCount: repository.starCount!,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
