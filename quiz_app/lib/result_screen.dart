import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  final void Function() restart;
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.restart});

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].ques,
          "correct_answer": questions[i].ans[0],
          "user_answer": chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final totalQues = questions.length;
    final correctAns = getSummary().where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $correctAns out of $totalQues questions correctly!",
            style: const TextStyle(color: Color.fromARGB(255, 210, 192, 33)),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(getSummary()),
          TextButton(
            onPressed: restart,
            child: const Text(
              "Restart quiz!",
              style: TextStyle(
                color: Color.fromARGB(255, 210, 192, 33),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
