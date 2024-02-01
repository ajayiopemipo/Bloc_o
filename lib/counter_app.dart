import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart'; // assuming you save the CounterBloc class in a separate file

class CounterApp extends StatelessWidget {
  final CounterBloc counterBloc = CounterBloc();

  CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App with BLoC'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is InitialCounterState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Count:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${state.count}',
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => counterBloc.add(IncrementEvent()),
                          child: const Text('Increment'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => counterBloc.add(DecrementEvent()),
                          child: const Text('Decrement'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return Container(); // Placeholder for other states (if any)
          },
        ),
      ),
    );
  }
}