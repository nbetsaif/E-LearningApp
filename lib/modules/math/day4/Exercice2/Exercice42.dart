import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../day4/Day4.dart';

class Exercice442 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice442> {
  @override
  List<String> Q2 = [
    '370 مي',
    '470 مي',
    '350 مي',
  ];
  List<bool> Q2Val = [
    false,
    false,
    false,
  ];
  List<bool> Q2sol = [
    true,
    false,
    false,
  ];
  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (eq(Q2Val, Q2sol)) {
      setState(() {
        score = score + 2;
      });
    }
  }

  List<String> Q3 = [
    '100 مي ',
    '520 مي',
    '220 مي',

  ];
  List<bool> Q3Val = [
    false,
    false,
    false,
  ];
  List<bool> Q3sol = [
    true,
    false,
    false,
  ];

  void CalculScoreQ3() {
    if (eq(Q3Val, Q3sol)) {
      setState(() {
        score = score + 2;
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
                    Expanded(
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        childAspectRatio: 0.8,
                        crossAxisCount: 1,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    end: 40, bottom: 20),
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  'الوضعية 1:',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent),
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    end: 40, bottom: 20),
                                alignment: Alignment.centerRight,
                                child: const Text(

                                  'تسلّم رامي من أبيه 3 قطع نقديّة من فئة 100 مي وقطعة نقدية من فئة 50 مي وقطعة من فئة 20 مي .اشترى بالمبلغ المتجمع لديه قلم رصاص ب 150 مي وملصقات بـ 120 مي وبطاقة بريديّة.',
                                  style: TextStyle(fontSize: 20,),textAlign: TextAlign.end,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'أَخْتَارُ الإِجَابَةَ الصَّحِيحَةَ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.pink),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'ما هو المبلغ الذي تحصّل عليه رامي؟ ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
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
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  ' ثمن البطاقة البريدية:ِ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.green),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      child: ListTile(
                                        title: Text(
                                          Q3[index],
                                          textAlign: TextAlign.end,
                                        ),
                                        trailing: Checkbox(
                                            value: Q3Val[index],
                                            onChanged: (val) {
                                              setState(() {
                                                Q3Val[index] = val!;
                                              });
                                            }),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: Q3.length,
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 5, bottom: 20),
                                  height: 250,
                                  width: 200,
                                  child: Image.asset('assets/images/kid2.png'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: Container(
                        child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {
                              CalculScoreQ3();
                              CalculScoreQ2();
                              setState(() {
                                daystate.i = 1;
                                daystate.refresh(score.toDouble());
                                daystate.refresh(score.toDouble());
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('أنهيت')),
                      ),
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
