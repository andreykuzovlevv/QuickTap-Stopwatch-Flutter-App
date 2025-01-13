import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch/stopwatch/stopwatch.dart';

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => StopwatchBloc(), child: const StopWatchView());
  }
}

class StopWatchView extends StatelessWidget {
  const StopWatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final time = context.select((StopwatchBloc bloc) => bloc.state.duration);
    return GestureDetector(
      onTap: () {
        switch (context.read<StopwatchBloc>().state.runtimeType) {
          case StopwatchInitial:
            context.read<StopwatchBloc>().add(const StartStopwatch());

          case StopwatchRunning:
            context.read<StopwatchBloc>().add(const PauseStopwatch());

          case StopwatchPaused:
            context.read<StopwatchBloc>().add(const ResumeStopwatch());
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Center(
              heightFactor: 10,
              child: Text(
                formatDuration(time),
                style: TextStyle(fontSize: 44),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: BlocBuilder<StopwatchBloc, StopwatchState>(
                builder: (context, state) {
                  switch (state) {
                    case StopwatchInitial():
                      return FloatingActionButton(
                          child: Icon(Icons.play_arrow),
                          onPressed: () => context
                              .read<StopwatchBloc>()
                              .add(StartStopwatch()));
                    case StopwatchRunning():
                      return FloatingActionButton(
                          child: Icon(Icons.pause),
                          onPressed: () => context
                              .read<StopwatchBloc>()
                              .add(PauseStopwatch()));
                    case StopwatchPaused():
                      return FloatingActionButton(
                          child: Icon(Icons.refresh_outlined),
                          onPressed: () => context
                              .read<StopwatchBloc>()
                              .add(ResetStopwatch()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDuration(Duration duration) {
  final hours = duration.inHours.toString();
  final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  final milliseconds =
      (duration.inMilliseconds % 1000).toString().padLeft(3, '0');

  return '$hours:$minutes:$seconds.$milliseconds';
}
