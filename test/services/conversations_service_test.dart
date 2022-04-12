import 'package:flutter/foundation.dart';
import 'package:instant_messaging_flutter/services/conversations_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  setUp(() {
    setupGetItMocks();
  });

  group('ConversationsServiceImpl', () {
    group('getConversations', () {
      test('the api should get called', () async {
        when(mockApiService.getConversations(0, 10)).thenAnswer((_) 
          => Future(() => {"conversations": []}));

        final sut = ConversationsServiceImpl();

        await sut.getConversations(0, 10);

        verify(mockApiService.getConversations).called(1);

        assert(listEquals(verify(mockApiService.getConversations).captured, [0, 10]) == true);
      });
    });
  });
}