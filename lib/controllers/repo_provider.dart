import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubapi/models/repo_box.dart';
import 'package:githubapi/models/repository_hive_model.dart';
import 'package:intl/intl.dart';

class RepositoryProviderModel extends ChangeNotifier {
  List<RepositroyHive> repositories = [];
  // This method will get the exact data from before 60 days
  String getDateTwoMonthsAgo() {
    var now = DateTime.now();
    var twoMonthsAgo =
        now.subtract(const Duration(days: 30)); // 60 days = 2 months
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(twoMonthsAgo);
  }

  //this methos is used to get the data from the api and it will emit data
  //as the created model(RepositoryModel)
  Future<void> fetchData() async {
    String date = getDateTwoMonthsAgo();
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://api.github.com/search/repositories',
        queryParameters: {
          'q': 'created:>$date',
          'sort': 'stars',
          'order': 'desc',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> items = jsonData['items'];
        final List<RepositroyHive> repositoryList = items.map((item) {
          final owner = item['owner'];
          return RepositroyHive(
            title: item['name'] ?? 'Unknown',
            description: item['description'] ?? 'No description',
            imageUrl: owner['avatar_url'],
            user: owner['login'],
            starCount: item['stargazers_count'].toString(),
          );
        }).toList();
        repositories = repositoryList;
        //creating the instance of box to crud operations
        final box = RepositoryBox.getInstance();
        //clearing the exinsting datas from the hive
        box.clear();
        //adding the new datas to the hive
        box.addAll(repositoryList);
        log(box.values.toString());

        notifyListeners();
      } else {
        log('Failed to fetch data');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
