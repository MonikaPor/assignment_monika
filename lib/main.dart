import 'package:assignment_monika/bloc/name_bloc.dart';
import 'package:assignment_monika/ui/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameBloc>(
          create: (context) => NameBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Name Search',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchPage(),
      ),
    );
  }
}
