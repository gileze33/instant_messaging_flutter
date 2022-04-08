import 'package:flutter_split/flutter_split.dart';

abstract class FeatureToggleService {
  Future<bool> isEnabled(String featureName);

  void setUserId(String userId);
}

class FeatureToggleSplitImpl extends FeatureToggleService {
  late String _userId; 
  late SplitAPI _splitAPI;

  FeatureToggleSplitImpl() {
    _splitAPI = SplitAPI(
      apiKey: 'YOUR_SPLIT_API_KEY',
      environmentIdOrName: 'YOUR_SPLIT_ENVIRONMENT_ID_OR_NAME',
      trafficType: 'user/worker'      
    );
  }

  @override
  Future<bool> isEnabled(String featureName) async {
    final splitDefinition = await _splitAPI.getSplitDefinition(featureName);

    return splitDefinition.hasUserFeatures(_userId);
  }

  @override
  void setUserId(String userId) {
    _userId = userId;
  }
}