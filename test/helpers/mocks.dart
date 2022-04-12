import 'package:instant_messaging_flutter/services/api_service.dart';
import 'package:instant_messaging_flutter/services/service_locator.dart';
import 'package:mockito/mockito.dart';

class MockApiService extends Mock implements ApiService {
  @override
  Future<Map<String, dynamic>> getConversations(int start, int limit) =>
    super.noSuchMethod(Invocation.method(#getConversations, [start, limit]), returnValue: Future(() => {"conversations": []}));
}

final mockApiService = MockApiService();

void setupGetItMocks() {
  getIt.registerSingleton<ApiService>(mockApiService);
}