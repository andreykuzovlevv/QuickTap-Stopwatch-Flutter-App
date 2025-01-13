import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  StopwatchBloc() : super(const StopwatchInitial()) {
    on<StartStopwatch>(_onStarted);
    on<PauseStopwatch>(_onPaused);
    on<ResumeStopwatch>(_onResumed);
    on<ResetStopwatch>(_onReset);
    on<_TickElapsed>(_onTickElapsed);
  }

  DateTime? _startTime;
  DateTime? _pauseTime;
  Duration _elapsedTime = Duration.zero;
  late Timer _timer; // Add a reference for the timer

  void _onStarted(StartStopwatch event, Emitter<StopwatchState> emit) {
    _elapsedTime = Duration.zero;
    _startTime = DateTime.now();
    _startTimer(emit);
  }

  void _onPaused(PauseStopwatch event, Emitter<StopwatchState> emit) {
    if (state is StopwatchRunning) {
      _pauseTime = DateTime.now();
      _elapsedTime = _pauseTime!.difference(_startTime!);
      _timer.cancel(); // Stop the timer when paused
      emit(StopwatchPaused(_elapsedTime));
    }
  }

  void _onResumed(ResumeStopwatch event, Emitter<StopwatchState> emit) {
    if (state is StopwatchPaused) {
      // Recalculate the elapsed time from when it was paused
      _startTime = DateTime.now().subtract(_elapsedTime);
      _startTimer(emit);
    }
  }

  void _onReset(ResetStopwatch event, Emitter<StopwatchState> emit) {
    _elapsedTime = Duration.zero;
    _timer.cancel(); // Stop the timer when reset
    emit(const StopwatchInitial());
  }

  void _onTickElapsed(_TickElapsed event, Emitter<StopwatchState> emit) {
    _elapsedTime = DateTime.now().difference(_startTime!);
    emit(StopwatchRunning(_elapsedTime));
  }

  void _startTimer(Emitter<StopwatchState> emit) {
    // Set up a periodic timer to update every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      add(_TickElapsed()); // Trigger the _TickElapsed event to update time
    });
  }

  @override
  Future<void> close() {
    _timer.cancel(); // Ensure timer is canceled when the bloc is closed
    return super.close();
  }
}
