enum Type {
  multiple,
  boolean
}

enum Difficulty {
  easy,
  medium,
  hard
}

class Question {
  // final int questionId;
  final String category;
  final Type type;
  final Difficulty difficulty;
  final String question;
  // final String answerOne;
  // final String answerTwo;
  // final String trueAnswer;
  final String correctAnswer;
  final List<dynamic> answers;
  // final int categoryId;
  // final String name;
  Question({this.difficulty, this.category, this.type, this.question, this.correctAnswer, this.answers});

  Question.fromMap(Map<String, dynamic> data):
      // questionId = data["id"],
    category = data["category"],
    type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
    difficulty = data["difficulty"] == "easy" ? Difficulty.easy : data["difficulty"] == "medium" ? Difficulty.medium : Difficulty.hard,
    question = data["question"],
    correctAnswer = data["correct_answer"],
    // question = data["question"],
    answers = data["answers"];

  static List<Question> fromData(List<Map<String,dynamic>> data){
    return data.map((question) => Question.fromMap(question)).toList();
  }

}