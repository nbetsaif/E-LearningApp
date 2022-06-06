import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../day2/Day2.dart';

class Exercice221 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice221> {
  @override
  List<String> Q2 = [
    '476+342=818',
    '476-342=134',
    '476-342=138',
  ];
  List<bool> Q2Val = [
    false,
    false,
    false,
  ];
  List<bool> Q2sol = [
    false,
    true,
    false,
  ];
  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (eq(Q2Val, Q2sol)) {
      setState(() {
        score = score + 1;
      });
    }
  }

  int score = 0;
  int i = 0;

  bool visible = false;
  double bottom = 0;
  double top = 0;

  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  void Visible() {
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    final Map Exercice = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TweenAnimationBuilder(
              onEnd: () async {
                setState(() {
                  call();
                });
                await Future.delayed(const Duration(milliseconds: 600));
                setState(() {
                  Visible();
                });
              },
              duration: const Duration(milliseconds: 1000),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (BuildContext context, double op, Widget? child) {
                return Opacity(
                  opacity: op,
                  child: child,
                );
              },
              child: AnimatedContainer(
                margin: EdgeInsetsDirectional.only(bottom: bottom, top: top),
                duration: const Duration(milliseconds: 500),
                alignment: Alignment.center,
                child: Text(
                  "${Exercice['number']}  السؤال",
                  style: const TextStyle(
                      fontSize: 48,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 150),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 20, bottom: 20),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        ':	الوضعية 1 ',
                        style:
                        TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(bottom: 20),
                      alignment: Alignment.center,
                      child: const Text(
                        '	حزمة بها 476 ورقة، استعمل منها التّلاميذ في حصص التّربية التّشكيلية 342 ورقة.  أحسب عدد الأوراق المتبقية مختارا العمليّة المناسبة ',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: MediaQuery.of(context).size.height/5,
                            child: ListTile(
                              title: Text(
                                Q2[index],
                                textAlign: TextAlign.end,
                              ),
                              trailing: Checkbox(
                                  value: Q2Val[index],
                                  onChanged: (val) {
                                    setState(() {
                                      Q2Val[index] = val!;
                                    });
                                  }),
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Q2.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            CalculScoreQ2();
                            setState(() {
                              daystate.i = 0;
                              daystate.refresh(score.toDouble());
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('أنهيت')),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
