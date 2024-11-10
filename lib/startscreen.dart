import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Image.asset(
              "assets/images/quiz-logo2.png",
              width: 390,
              height: 230,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            '''Take a Quiz &\n  Test Your Knowledge''',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.play_arrow),
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 11, 69),
              backgroundColor: const Color(0xFF8C7DFF),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            label: const Text("Start Quizzy"),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class StartScreen extends StatelessWidget {
//   const StartScreen(this.startQuiz, {super.key});
//   final void Function() startQuiz;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 50.0),
//             child: Image.asset(
//               "assets/images/quiz-logo2.png",
//               width: 390,
//               height: 230,
//               color: const Color.fromARGB(255, 255, 249, 200),
//             ),
//           ),
//           Text(
//             '''Take a Quiz &\n  Test Your Knowledge :)''',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.playfairDisplay(
//               textStyle: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 255, 255, 255),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: startQuiz,
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               backgroundColor: const Color(0xFF8C7DFF),
//               foregroundColor: Colors.white,
//               textStyle: const TextStyle(fontSize: 18),
//             ),
//             child: const Text('Start Quiz'),
//           ),
//         ],
//       ),
//     );
//   }
// }
