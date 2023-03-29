import 'distance/distance_trigger.dart';
import 'shock/shock_detector.dart';

class RsicxEngine {
  final DistanceTrigger _distanceTrigger;
  final ShockDetector _shockDetector;

  RsicxEngine(
    double triggerDistance,
    double shockThreshold,
  )   : _distanceTrigger = DistanceTrigger(triggerDistance),
        _shockDetector = ShockDetector(shockThreshold);

  DistanceTrigger get distanceTrigger => _distanceTrigger;
  ShockDetector get shockDetector => _shockDetector;
}
