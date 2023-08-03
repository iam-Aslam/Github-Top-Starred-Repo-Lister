import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:githubapi/models/respository_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RepositoryProviderModel extends ChangeNotifier {
  List<RepositoryModel> repositories = [];

  //this methos is used to get the data from the api and it will emit data as the created model(RepositoryModel)
  Future<void> fetchData() async {
    //this method will get the exact datas before 60 days
    String getDateTwoMonthsAgo() {
      var now = DateTime.now();
      var twoMonthsAgo =
          now.subtract(const Duration(days: 60)); // 60 days = 2 months
      var formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(twoMonthsAgo);
    }

    String date = getDateTwoMonthsAgo();

    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=created:>$date&sort=stars&order=desc'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> items = jsonData['items'];
      final List<RepositoryModel> repositoryList = items.map((item) {
        final owner = item['owner'];
        return RepositoryModel(
          title: item['name'],
          description: item['description'] ?? 'No description',
          imageUrl: owner['avatar_url'],
          user: owner['login'],
          starCount: item['stargazers_count'].toString(),
        );
      }).toList();

      repositories = repositoryList;
      notifyListeners();
    } else {
      debugPrint('Failed to fetch data');
    }
  }
}
