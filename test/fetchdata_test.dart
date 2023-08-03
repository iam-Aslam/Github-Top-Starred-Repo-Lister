import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/controllers/repo_provider.dart';

void main() {
  test('fetchData testing', () async {
    // Arrange
    final repositoryFetcher = RepositoryProviderModel();
    // Act
    await repositoryFetcher.fetchData();
    // Assert
    expect(repositoryFetcher.repositories.length, equals(30));
    // Assuming 30 repositories are returned in the data(in api they are giving 30 datas) so i used that api and compared the data.
  });
}
