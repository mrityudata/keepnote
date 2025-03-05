import 'dart:async';

class GlobalActionManager{
  static final GlobalActionManager _globalActionManager = GlobalActionManager._internal();

  GlobalActionManager._internal();

  factory GlobalActionManager(){
    return _globalActionManager;
  }

  final StreamController<dynamic> _eventController = StreamController.broadcast();
  Stream<dynamic> get eventStream => _eventController.stream;

  void postAction(dynamic action) {
    return _eventController.add(action);
  }

  void dispose(){
    _eventController.close();
  }
}