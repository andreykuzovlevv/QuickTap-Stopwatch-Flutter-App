part of 'stopwatch_bloc.dart';

sealed class StopwatchEvent extends Equatable {
  const StopwatchEvent();

  @override
  List<Object> get props => [];
}

final class StartStopwatch extends StopwatchEvent {
  const StartStopwatch();
}

final class PauseStopwatch extends StopwatchEvent {
  const PauseStopwatch();
}

final class ResumeStopwatch extends StopwatchEvent {
  const ResumeStopwatch();
}

final class ResetStopwatch extends StopwatchEvent {
  const ResetStopwatch();
}

final class _TickElapsed extends StopwatchEvent {
  const _TickElapsed();
}
