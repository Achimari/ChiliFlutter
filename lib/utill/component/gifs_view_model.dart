import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../core/api_srvice.dart';
import '../../core/responce/gifs_item.dart';
import '../constant.dart';

class GifsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiServiceImplementation();

  final _gifsController = StreamController<List<GifsItem>>();
  Stream<List<GifsItem>> get gifsStream => _gifsController.stream;

  String tempQuery = "";
  int limit = 10;
  int offset = 0;

  late List<GifsItem> _gifs = [];
  List<GifsItem> get gifs => _gifs;

  Future<void> _loadGifs(String query, String key, {bool isNewSearch = false}) async {
    try {
      List<GifsItem> response = await _apiService.searchGifs(query, key, limit, offset, null);
      if (isNewSearch) {
        _gifs = List.from(response);
      } else {
        _gifs.addAll(response);
      }
      _gifsController.add(_gifs);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
    }
  }

  Future<void> searchGifs(String query, String key) async {
    tempQuery = query;
    offset = 0; // Reset the offset
    await _loadGifs(query, key, isNewSearch: true);
  }

  Future<void> loadMore() async {
    offset += limit;
    await _loadGifs(tempQuery, Constant.KEY);
  }

  @override
  void dispose() {
    _gifsController.close();
    super.dispose();
  }
}