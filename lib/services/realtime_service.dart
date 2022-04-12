import 'package:flutter/foundation.dart';

class RealtimeServiceImpl extends ChangeNotifier {
  List<String> _subscribedChannels = [];

  get subscribedChannels => _subscribedChannels;

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }
}