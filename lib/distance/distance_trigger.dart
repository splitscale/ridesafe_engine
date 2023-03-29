import 'dart:async';

class DistanceTrigger {
  final StreamController<double> _distanceController =
      StreamController<double>();
  double _distance = 0;
  double _lastSpeed = 0;
  DateTime _lastLocationTime = DateTime.now();
  final double _distanceLimit;

  DistanceTrigger(this._distanceLimit);

  void trackDistance(DateTime locationTime, double speed) {
    double timeInSeconds =
        locationTime.difference(_lastLocationTime).inMilliseconds / 1000.0;
    double distanceTraveled = timeInSeconds * (_lastSpeed + speed) / 2.0;
    _distance += distanceTraveled;

    if (_distance >= _distanceLimit) {
      _distanceController.add(_distance);
      _distance = 0;
    }

    _lastLocationTime = locationTime;
    _lastSpeed = speed;
  }

  Stream<double> get distanceStream => _distanceController.stream;
}
