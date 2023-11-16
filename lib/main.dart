import 'package:bar_creation/bloc/line_values_bloc.dart';
import 'package:bar_creation/line_with_values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
        create: (context) => LineWithValuesBloc(),
        child:MyApp()));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Range Indicator'),
          ),
          body: LineWithValues(),
        ),
      );
  }
}


