import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String answerOption;
  final Function() next;
  const Option({
    super.key,
    required this.answerOption,
    required this.next,
  });

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: next,
          child: Text(
            answerOption,
            textAlign: TextAlign.center,
          )),
    );
  }
}
