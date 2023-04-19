import 'package:assignment_monika/model/name_model.dart';
import 'package:flutter/material.dart';

class SearchListWidget extends StatefulWidget {
  final List<NameModel> nameList;

  const SearchListWidget({required this.nameList, Key? key}) : super(key: key);

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.nameList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              thickness: 2,
            ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.nameList[index].name ?? "",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
              key: Key("item_index_$index"),
            ),
          );
        });
  }
}
