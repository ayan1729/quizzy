import 'package:flutter/material.dart';
import 'package:quizzy/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.isTimeUp,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;
  final bool isTimeUp;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].correctAnswer,
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.only(bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: isTimeUp
                        ? 'Oops!! Times up\n'
                        : 'Yay!! You finished on time\n',
                    style: GoogleFonts.playfairDisplay(
                      color: isTimeUp
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color.fromARGB(255, 255, 255,
                              255), // Different colors for different messages
                      fontSize:
                          21, // Larger size for the first part of the message
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Your score: ',
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(
                          255, 10, 0, 150), // Default color for the score text
                      fontSize:
                          22, // Smaller size for the text before the score
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '$numCorrectQuestions/$numTotalQuestions',
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            QuestionSummary(summaryData),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 5, 5, 5),
                  backgroundColor: const Color(0xFF8C7DFF)),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quizzy/questions_summary/questions_summary.dart';
// import 'package:quizzy/data/questions.dart';

// class ResultsScreen extends StatelessWidget {
//   const ResultsScreen({
//     super.key,
//     required this.chosenAnswers,
//     required this.onRestart,
//     required this.isTimeUp,
//   });

//   final void Function() onRestart;
//   final List<String> chosenAnswers;
//   final bool isTimeUp;

//   List<Map<String, Object>> getSummaryData() {
//     final List<Map<String, Object>> summary = [];

//     for (var i = 0; i < chosenAnswers.length; i++) {
//       summary.add({
//         'question_index': i,
//         'question': questions[i].text,
//         'correct_answer': questions[i].correctAnswer,
//         'user_answer': chosenAnswers[i],
//       });
//     }
//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final summaryData = getSummaryData();
//     final numTotalQuestions = questions.length;
//     final numCorrectQuestions = summaryData.where((data) {
//       return data['user_answer'] == data['correct_answer'];
//     }).length;

//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.all(50),
//         padding: const EdgeInsets.only(bottom: 70),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(
//                     text: isTimeUp
//                         ? 'Oops!! Times up\n'
//                         : 'Yay!! You finished on time\n',
//                     style: GoogleFonts.playfairDisplay(
//                       color: isTimeUp
//                           ? const Color.fromARGB(255, 255, 255, 255)
//                           : const Color.fromARGB(255, 255, 255, 255),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Your score: ',
//                     style: GoogleFonts.lato(
//                       color: const Color.fromARGB(255, 10, 0, 150),
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: '$numCorrectQuestions/$numTotalQuestions',
//                     style: GoogleFonts.lato(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 50),
//             QuestionSummary(summaryData),
//             const SizedBox(height: 30),
//             ElevatedButton.icon(
//               onPressed: onRestart,
//               style: ElevatedButton.styleFrom(
//                   foregroundColor: const Color.fromARGB(255, 5, 5, 5),
//                   backgroundColor: const Color(0xFF8C7DFF)),
//               icon: const Icon(Icons.refresh),
//               label: const Text(
//                 'Restart Quiz',
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
