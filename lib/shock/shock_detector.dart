import 'dart:async';
import 'dart:math';

class ShockDetector {
  final StreamController<bool> _shockController = StreamController<bool>();
  final double _threshold;
  bool _isDetecting = false;

  ShockDetector(this._threshold);

  Future<void> startDetecting(double x, double y, double z) async {
    if (_isDetecting) return;

    _isDetecting = true;
    double acceleration = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
    if (acceleration > _threshold) {
      _shockController.add(true);
    }
  }

  void stopDetecting() {
    _isDetecting = false;
  }

  Stream<bool> get shockStream => _shockController.stream;
}
