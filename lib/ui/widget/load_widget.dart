import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Center(
          child: LoadingIndicator(
        key: Key('loading_indicator'),
        colors: [Colors.purple],
        indicatorType: Indicator.ballClipRotate,
      )),
    );
  }
}
