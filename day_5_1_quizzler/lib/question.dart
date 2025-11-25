// class Question {
//   String question;
//   bool answer;
//
//   Question({String q,bool a}){
//     question = q;
//     answer = a;
//   }
// }
// Due to introduction of null safety in Dart, the code above doesn't work
// We can't let q and a be null if none are passed to the constructor, so we must set them as required
// Additionally, the implication for this is that even when defining properties of a class,
// we must either initialize them as non-null or declare them as 'late' to not allow usage until initialized

// The following is an acceptable solution, and one I came to via trial and error
// class Question {
//   late String question;
//   late bool answer;
//
//   Question({required String q, required bool a}){
//     question = q;
//     answer = a;
//   }
// }
// But there's another way to instead use the final keyword which can't be used as a setter
// This means that the arguments accepted must directly be the properties instead of getting values
// and then setting them to be equal

// class Question {
//   final String question;
//   final bool answer;
//
//   Question({required this.question, required this.answer}){
//   }
// }
// Here we simply initialize the question and answer properties, and we must use the 'this' keyword
// to refer to this instance of the class. Apparently we didn't need to do so when setting inside constructor body.

// But we can avoid the required keyword by making it a positional parameter (the questions are given that way in README)
class Question {
  final String question;
  final bool answer;

  Question(this.question, this.answer){}
}
// And in the final lesson, the course did use this exact format (except the modifiers) for the constructor.