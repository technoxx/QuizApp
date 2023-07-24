import 'package:flutter/material.dart';
import 'package:quiz_app/answer_option.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void nextques(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentQuestion.ques,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 210, 192, 33), fontSize: 17),
        ),
        const SizedBox(
          height: 40,
        ),
        ...currentQuestion.getShuffledAnswers().map((answer) {
          return Option(
            answerOption: answer,
            next: () {
              nextques(answer);
            },
          );
        })
      ],
    );
  }
}
