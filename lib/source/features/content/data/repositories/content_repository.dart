import 'package:dio/dio.dart';
import 'package:tecnical_task/source/core/services/api_service.dart';
import 'package:tecnical_task/source/features/content/data/models/content_item_model.dart';

abstract class ContentRepository {
  Future<List<ContentItemModel>> fetchContent();
}

class ContentRepositoryImpl implements ContentRepository {
  final ApiService _apiService;

  ContentRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<List<ContentItemModel>> fetchContent() async {
    try {
      // Simulate additional delay (1-2 seconds)
      await Future.delayed(const Duration(seconds: 1));

      final response = await _apiService.dio.get('/posts?_limit=10');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => ContentItemModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch content');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch content: $e');
    }
  }
}
