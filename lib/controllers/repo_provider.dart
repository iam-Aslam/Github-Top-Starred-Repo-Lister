import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubapi/models/respository_model.dart';
import 'package:intl/intl.dart';

class RepositoryProviderModel extends ChangeNotifier {
  List<RepositoryModel> repositories = [];

  //this methos is used to get the data from the api and it will emit data
  //as the created model(RepositoryModel)
  Future<void> fetchData() async {
    // This method will get the exact data from before 60 days
    String getDateTwoMonthsAgo() {
      var now = DateTime.now();
      var twoMonthsAgo =
          now.subtract(const Duration(days: 30)); // 60 days = 2 months
      var formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(twoMonthsAgo);
    }

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
        final List<RepositoryModel> repositoryList = items.map((item) {
          final owner = item['owner'];
          return RepositoryModel(
            title: item['name'] ?? 'Unknown',
            description: item['description'] ?? 'No description',
            imageUrl: owner['avatar_url'],
            user: owner['login'],
            starCount: item['stargazers_count'].toString(),
          );
        }).toList();
        repositories = repositoryList;
        notifyListeners();
      } else {
        log('Failed to fetch data');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
