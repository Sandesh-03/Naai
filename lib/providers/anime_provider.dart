import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../models/anime.dart';

class AnimeProvider with ChangeNotifier {
  final List<Anime> _animeList = [];
  final List<Anime> _likedList = [];
  String? _error;
  bool isLoading = false;
  bool isError = false;
  String errorMessage = '';
  List<Anime> searchList = [];
  List<Anime> get animeList => _animeList;
  List<Anime> get likedAnimeList => _likedList;

  String? get error => _error;

  AnimeProvider() {
    _loadLikedAnimes();
  }

  Future<void> _loadLikedAnimes() async {
    final box = await Hive.openBox<Anime>('animeBox');
    _likedList.addAll(box.values);
    notifyListeners();
  }

  Future<void> searchData(String query) async {
    final String url = Uri.encodeFull(api_url + '?q=$query&limit=12');
    try {
      isLoading = true;
      isError = false;
      var dio = Dio();
      var response = await dio.get(url);
      List<Anime> tempData = [];
      List items = response.data['data'];
      tempData = items.map((data) => Anime.fromJson(data)).toList();
      searchList = tempData.cast<Anime>();
      isLoading = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        isError = true;
        errorMessage = 'An Error Has Occurred Please Try Again';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.connectionTimeout) {
        isError = true;
        errorMessage = 'Your Connection has Timed Out';
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.receiveTimeout) {
        errorMessage = 'Unable to Connect to the Server';
        isError = true;
        notifyListeners();
        return;
      }
      if (e.type == DioErrorType.unknown) {
        errorMessage = 'Something Went Wrong\nPlease Check Your Connection';
        isError = true;
        notifyListeners();
        return;
      }
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> toggleLike(Anime anime) async {
    anime.isLiked = !anime.isLiked;
    final box = await Hive.openBox<Anime>('animeBox');
    if (anime.isLiked) {
      await box.put(anime.title, anime);
      _likedList.add(anime);
    } else {
      await box.delete(anime.title);
      _likedList.remove(anime);
    }
    notifyListeners();
  }
}
