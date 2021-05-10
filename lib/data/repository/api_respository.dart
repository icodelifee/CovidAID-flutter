abstract class APIRepository {
  Future<List<String>> getAllStates();
  Future<List<String>> getSearchResults(String query);
}
