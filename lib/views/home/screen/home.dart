import 'package:flutter/material.dart';
import 'package:githubapi/controllers/repo_provider.dart';
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
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Consumer<RepositoryProviderModel>(
            builder: (context, provider, _) {
              if (provider.repositories.isEmpty) {
                provider.fetchData();
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  itemCount: provider.repositories.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    );
                  },
                  itemBuilder: (context, index) {
                    final repository = provider.repositories[index];
                    return ListCard(
                      title: repository.title,
                      description: repository.description,
                      imageUrl: repository.imageUrl,
                      user: repository.user,
                      starCount: repository.starCount,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
