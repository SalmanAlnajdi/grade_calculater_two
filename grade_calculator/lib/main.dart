import 'package:flutter/material.dart';

void main() {
  runApp(const GradeCalculater());
}

class GradeCalculater extends StatelessWidget {
  const GradeCalculater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

String calculate(String nums) {
  int number = int.parse(nums);
  String result = " ";
  if (number >= 90) {
    return result = "A";
  } else if (number >= 80) {
    return result = "B";
  } else if (number >= 70) {
    return result = "C";
  } else if (number >= 60) {
    return result = "D";
  } else {
    return result = "F";
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController gradeController = new TextEditingController();

  String result = " ";

  getInput() {
    setState(() {
      result = calculate(gradeController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "Grade Calculater",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 35, right: 35, bottom: 70),
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: gradeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 137, 80, 234),
                          width: 3.0)),
                  hintText: "Type your score",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(
                    Icons.percent_rounded,
                    color: Colors.pink,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: getInput,
                child: Text("calculate"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: Colors.pinkAccent,
                    padding: EdgeInsets.all(20),
                    textStyle: TextStyle(fontSize: 20))),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(15),
              child: Text(
                "$result",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.pinkAccent),
              ))
        ],
      ),
    );
  }
}
