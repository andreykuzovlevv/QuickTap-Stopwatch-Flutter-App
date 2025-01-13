part of 'stopwatch_bloc.dart';

sealed class StopwatchState extends Equatable {
  const StopwatchState(this.duration);

  final Duration duration;

  @override
  List<Object> get props => [duration];
}

final class StopwatchInitial extends StopwatchState {
  const StopwatchInitial() : super(Duration.zero);

  @override
  String toString() => 'StopwatchInitial { duration: $duration }';
}

final class StopwatchRunning extends StopwatchState {
  const StopwatchRunning(super.duration);

  @override
  String toString() => 'StopwatchRunning { duration: $duration }';
}

final class StopwatchPaused extends StopwatchState {
  const StopwatchPaused(super.duration);

  @override
  String toString() => 'StopwatchPaused { duration: $duration }';
}
