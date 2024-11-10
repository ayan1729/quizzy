import 'package:flutter/material.dart';
import 'package:quizzy/startscreen.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/results_screen.dart';
import 'package:quizzy/questionsscreen.dart';
import 'dart:async';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  bool isTimeUp = false;
  int remainingTime = 150;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          onTimeUp();
        }
      });
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      startTimer();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      _timer?.cancel();
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
      isTimeUp = false;
      remainingTime = 150;
      startTimer();
    });
  }

  void onTimeUp() {
    _timer?.cancel();
    setState(() {
      isTimeUp = true;
      activeScreen = 'results-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        onTimeUp: onTimeUp,
        remainingTime: remainingTime,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        isTimeUp: isTimeUp,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00C6FF),
                  Color(0xFF0072FF),
                  Color(0xFF004E92),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon(
              //   Icons.quiz_outlined,
              //   color: Colors.white,
              //   size: 28,
              // ),
              SizedBox(width: 8),
              Text(
                "Quizzy",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 8, 97),
                ),
              ),
            ],
          ),
          actions: const [
            Icon(
              Icons.notifications_active_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            )
          ],
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00C6FF),
                Color(0xFF0072FF),
                Color(0xFF004E92),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cleans up the timer when the widget is disposed
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:quizzy/startscreen.dart';
// import 'package:quizzy/data/questions.dart';
// import 'package:quizzy/results_screen.dart';
// import 'package:quizzy/questionsscreen.dart';
// import 'dart:async';

// class Quiz extends StatefulWidget {
//   const Quiz({super.key});
//   @override
//   State<Quiz> createState() {
//     return _QuizState();
//   }
// }

// class _QuizState extends State<Quiz> {
//   List<String> selectedAnswers = [];
//   var activeScreen = 'start-screen';
//   bool isTimeUp = false;
//   int remainingTime = 150;
//   Timer? _timer;

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (remainingTime > 0) {
//           remainingTime--;
//         } else {
//           onTimeUp();
//         }
//       });
//     });
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions-screen';
//       startTimer();
//     });
//   }

//   void chooseAnswer(String answer) {
//     selectedAnswers.add(answer);

//     if (selectedAnswers.length == questions.length) {
//       _timer?.cancel();
//       setState(() {
//         activeScreen = 'results-screen';
//       });
//     }
//   }

//   void restartQuiz() {
//     setState(() {
//       selectedAnswers = [];
//       activeScreen = 'questions-screen';
//       isTimeUp = false;
//       remainingTime = 150;
//       startTimer();
//     });
//   }

//   void onTimeUp() {
//     _timer?.cancel();
//     setState(() {
//       isTimeUp = true;
//       activeScreen = 'results-screen';
//     });
//   }

//   @override
//   Widget build(context) {
//     Widget screenWidget = StartScreen(switchScreen);

//     if (activeScreen == 'questions-screen') {
//       screenWidget = QuestionsScreen(
//         onSelectAnswer: chooseAnswer,
//         onTimeUp: onTimeUp,
//         remainingTime: remainingTime,
//       );
//     }

//     if (activeScreen == 'results-screen') {
//       screenWidget = ResultsScreen(
//         chosenAnswers: selectedAnswers,
//         onRestart: restartQuiz,
//         isTimeUp: isTimeUp,
//       );
//     }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF00C6FF),
//                   Color(0xFF0072FF),
//                   Color(0xFF004E92),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//           leading: const Icon(
//             Icons.menu,
//             color: Colors.black,
//           ),
//           title: const Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(width: 8),
//               Text(
//                 "Quizzy",
//                 style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 28,
//                   color: Color.fromARGB(255, 0, 8, 97),
//                 ),
//               ),
//             ],
//           ),
//           actions: const [
//             Icon(
//               Icons.notifications_active_rounded,
//               color: Colors.black,
//             ),
//             SizedBox(width: 10),
//             Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//             SizedBox(width: 5)
//           ],
//           elevation: 10,
//           shadowColor: Colors.black.withOpacity(0.5),
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF00C6FF),
//                 Color(0xFF0072FF),
//                 Color(0xFF004E92),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: screenWidget,
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // Cleans up the timer when the widget is disposed
//     super.dispose();
//   }
// }
