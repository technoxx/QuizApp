import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 10,
                    child:
                        Text(((data['question_index'] as int) + 1).toString())),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question']).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(214, 255, 255, 255),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        (data['user_answer']).toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 242, 83, 191)),
                      ),
                      Text(
                        "Ans: ${data['correct_answer']}",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 165, 214)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
