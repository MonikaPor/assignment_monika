import 'package:assignment_monika/bloc/name_bloc.dart';
import 'package:assignment_monika/bloc/name_event.dart';
import 'package:assignment_monika/bloc/name_state.dart';
import 'package:assignment_monika/model/name_model.dart';
import 'package:assignment_monika/ui/search_page.dart';
import 'package:assignment_monika/ui/widget/empty_state_widget.dart';
import 'package:assignment_monika/ui/widget/error_state_widget.dart';
import 'package:assignment_monika/ui/widget/load_widget.dart';
import 'package:assignment_monika/ui/widget/search_list_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNameBloc extends MockBloc<NameEvent, NameState> implements NameBloc {}

void main() {
  late MockNameBloc mockNameBloc;
  Widget createSearchPage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameBloc>(
          create: (context) => mockNameBloc,
        ),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: SearchPage(),
        ),
      ),
    );
  }

  setUp(() {
    mockNameBloc = MockNameBloc();
  });

  testWidgets('Search Page Loading test', (WidgetTester tester) async {
    whenListen(
      mockNameBloc,
      Stream.fromIterable([
        InitialGetNameState(),
        LoadingNameState(),
      ]),
      initialState: InitialGetNameState(),
    );
    //when
    expect(mockNameBloc.state, isA<InitialGetNameState>());
    await tester.pumpWidget(createSearchPage());
    expect(mockNameBloc.state, isA<LoadingNameState>());
    await tester.pump();
    expect(find.byType(LoadWidget), findsOneWidget);
  });

  testWidgets('Search Page Loading success test', (WidgetTester tester) async {
    NameModel nameModel = NameModel(name: 'Monika');
    List<NameModel> nameListModel = [nameModel];

    whenListen(
      mockNameBloc,
      Stream.fromIterable([
        InitialGetNameState(),
        SuccessGetNameState(nameList: nameListModel),
      ]),
      initialState: InitialGetNameState(),
    );
    //when
    expect(mockNameBloc.state, isA<InitialGetNameState>());
    await tester.pumpWidget(createSearchPage());
    expect(mockNameBloc.state, isA<SuccessGetNameState>());
    await tester.pump();
    expect(find.byType(SearchListWidget), findsOneWidget);
  });

  testWidgets('Search Page Error test', (WidgetTester tester) async {
    whenListen(
      mockNameBloc,
      Stream.fromIterable([
        InitialGetNameState(),
        ErrorGetNameState(),
      ]),
      initialState: InitialGetNameState(),
    );
    //when
    expect(mockNameBloc.state, isA<InitialGetNameState>());
    await tester.pumpWidget(createSearchPage());
    expect(mockNameBloc.state, isA<ErrorGetNameState>());
    await tester.pump();
    expect(find.byType(ErrorStateWidget), findsOneWidget);
  });

  testWidgets('Search Page Empty test', (WidgetTester tester) async {
    whenListen(
      mockNameBloc,
      Stream.fromIterable([
        InitialGetNameState(),
        EmptyGetNameState(),
      ]),
      initialState: InitialGetNameState(),
    );
    //when
    expect(mockNameBloc.state, isA<InitialGetNameState>());
    await tester.pumpWidget(createSearchPage());
    expect(mockNameBloc.state, isA<EmptyGetNameState>());
    await tester.pump();
    expect(find.byType(EmptyStateWidget), findsOneWidget);
  });
}
