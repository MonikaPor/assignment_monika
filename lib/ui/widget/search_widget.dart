import 'package:assignment_monika/bloc/name_bloc.dart';
import 'package:assignment_monika/bloc/name_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input name',
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                context
                    .read<NameBloc>()
                    .add(GetNameEvent(inputName: _nameController.text));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                context
                    .read<NameBloc>()
                    .add(GetNameEvent(inputName: _nameController.text));
              },
              child: const Icon(Icons.search, size: 36),
            ),
          )
        ],
      ),
    );
  }
}
