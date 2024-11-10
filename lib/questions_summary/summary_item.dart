import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 5,
          height: 130,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 2,
              // ),
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Text(
                "Your answer: ${itemData['user_answer'] as String}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 20, 19, 19),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Correct answer: ${itemData['correct_answer'] as String}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 155, 255, 155),
                    //color: Color.fromARGB(255, 10, 216, 17),
                    // color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
