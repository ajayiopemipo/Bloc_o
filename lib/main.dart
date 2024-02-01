import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_app.dart';
import 'counter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        // Add other Bloc providers if needed
      ],
      child: CounterApp(),
    ),
  );
}
