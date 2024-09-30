import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List allQuestions = [
    {
      "question":
          "The headquarters of General Agreement on Tariffs & Trade (GATT) is located in …",
      "option": ["Geneva", "London", "Manila", "Jakarta"],
      "answer": 0
    },
    {
      "question": "Ozone layer is found in ……",
      "option": ["Troposphere", "Stratosphere", "Thermosphere", "Mesosphere"],
      "answer": 1
    },
    {
      "question":
          "Which among the following is popular as City of Golden Gate?",
      "option": ["Rome", "New York", "San Francisco", "Paris"],
      "answer": 2
    },
    {
      "question": "The book, ‘War and Peace,’ was written by …",
      "option": [
        "Adam Smith",
        "David Baldacci",
        "Charles Darwin",
        "Leo Tolstoy"
      ],
      "answer": 3
    }
  ];

  int questionIndex = 0;
  int score = 0;
  int selectedOption = -1;
  bool result = false;

  WidgetStateProperty<Color?> checkColor(int ansChoice) {
    if (selectedOption != -1) {
      if (ansChoice == allQuestions[questionIndex]["answer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedOption == ansChoice) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    }
    return const WidgetStatePropertyAll(null);
  }

  Text checkScore() {
    if (score > 1) {
      return const Text(
        "Congrats",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return const Text(
      "Oooopsssss",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Image checkScoreForImage() {
    if (score > 1) {
      return Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA-V9BkQYcVRqTgUb3eo_uSvbYCqcaaYnpQw&s");
    }
    return Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHbdGNnJN2Ai7MI6tBukMfmWjYf7Vzpcd6AA&s");
  }

  @override
  Widget build(BuildContext context) {
    if (result) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[300],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkScoreForImage(),
              checkScore(),
              Text(
                "Your Score : $score/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                  ),
                  onPressed: () {
                    result = false;
                    score = 0;
                    questionIndex = 0;
                    selectedOption = -1;
                    setState(() {});
                  },
                  child: const Text(
                    "Restart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[300],
        ),
        body: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question : ${questionIndex + 1}/${allQuestions.length}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 400,
                  child: Text(
                    "${allQuestions[questionIndex]["question"]}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 51, 0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkColor(0),
                    ),
                    onPressed: () {
                      if (selectedOption == -1) {
                        selectedOption = 0;
                        if (selectedOption ==
                            allQuestions[questionIndex]["answer"]) score++;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "${allQuestions[questionIndex]["option"][0]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkColor(1),
                    ),
                    onPressed: () {
                      if (selectedOption == -1) {
                        selectedOption = 1;
                        if (selectedOption ==
                            allQuestions[questionIndex]["answer"]) score++;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "${allQuestions[questionIndex]["option"][1]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkColor(2),
                    ),
                    onPressed: () {
                      if (selectedOption == -1) {
                        selectedOption = 2;
                        if (selectedOption ==
                            allQuestions[questionIndex]["answer"]) score++;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "${allQuestions[questionIndex]["option"][2]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkColor(3),
                    ),
                    onPressed: () {
                      if (selectedOption == -1) {
                        selectedOption = 3;
                        if (selectedOption ==
                            allQuestions[questionIndex]["answer"]) score++;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "${allQuestions[questionIndex]["option"][3]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              child: Text(
                "Your Current Score :$score",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[100],
          onPressed: () {
            if (selectedOption != -1) {
              if (questionIndex < allQuestions.length - 1) {
                questionIndex++;
                selectedOption = -1;
                setState(() {});
              } else {
                result = true;
                setState(() {});
              }
            }
          },
          child: const Icon(Icons.forward_sharp),
        ),
      );
    }
  }
}
