class QuizQuestion {
  final String ques;
  final List<String> ans;

  const QuizQuestion(this.ques, this.ans);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(ans);
    shuffledList.shuffle();
    return shuffledList;
  }
}
