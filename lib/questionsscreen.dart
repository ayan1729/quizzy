import 'package:flutter/material.dart';
import 'package:quizzy/answerbutton.dart';
import 'package:quizzy/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.remainingTime,
    required this.onTimeUp,
  });

  final void Function(String answer) onSelectAnswer;
  final int remainingTime;
  final VoidCallback onTimeUp;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    shuffledAnswers = questions[currentQuestionIndex].getShuffledAnswers();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex < questions.length) {
        shuffledAnswers = questions[currentQuestionIndex].getShuffledAnswers();
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    if (widget.remainingTime == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onTimeUp();
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                // color: const Color.fromARGB(
                //     255, 11, 210, 210), // Background color for highlighting
                color: const Color(0xFF8C7DFF),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(
                'Timer- ${widget.remainingTime ~/ 60}:${(widget.remainingTime % 60).toString().padLeft(2, '0')}',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 22,
                  // fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              currentQuestion.text,
              style: GoogleFonts.playfairDisplay(
                color: const Color.fromARGB(255, 2, 4, 78),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
