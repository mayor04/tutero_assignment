import 'dart:async';

abstract class StateListener<T> {
  final StreamController<T> _stateControl = StreamController.broadcast();
  Stream<T> get _stateStream => _stateControl.stream;

  late T state;

  StateListener(T initialState) {
    state = initialState;
    _stateControl.add(state);
  }

  StreamSubscription<T> addListener(Function(T value) listener) {
    return _stateStream.listen(listener);
  }

  addState(T state) {
    this.state = state;
    _stateControl.add(state);
  }
}
