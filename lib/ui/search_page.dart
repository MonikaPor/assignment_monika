import 'package:assignment_monika/bloc/name_bloc.dart';
import 'package:assignment_monika/bloc/name_state.dart';
import 'package:assignment_monika/ui/widget/empty_state_widget.dart';
import 'package:assignment_monika/ui/widget/error_state_widget.dart';
import 'package:assignment_monika/ui/widget/load_widget.dart';
import 'package:assignment_monika/ui/widget/search_list_widget.dart';
import 'package:assignment_monika/ui/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Name'),
          backgroundColor: Colors.purple,
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const SearchWidget(),
              Expanded(child:
                  BlocBuilder<NameBloc, NameState>(builder: (context, state) {
                if (state is LoadingNameState) {
                  return const LoadWidget();
                } else if (state is SuccessGetNameState) {
                  return SearchListWidget(nameList: state.nameList);
                } else if (state is EmptyGetNameState) {
                  return const EmptyStateWidget();
                } else if (state is ErrorGetNameState) {
                  return const ErrorStateWidget();
                }
                return Container();
              }))
            ],
          ),
        ));
  }
}
