import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../day3/Day3.dart';


class Exercice332 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice332> {
  @override
  List<String> Q2 = [
    'كَمْ تَمْلِكُ آمَالُ ؟  ',
    'كَمْ ثَمَنُ اللُّعْبَةِ ؟',
    'مَا هُو المَبْلَغُ المُتَبَقِّي لَهَا؟',
  ];
  List<bool> Q2Val = [
    false,
    false,
    false,
  ];
  List<bool> Q2sol = [
    false,
    false,
    true,
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
    'عَمَلِيَّةَ جَمْعٍ',
    'عَمَلِيَّةَ طَرْحٍ  ',
  ];
  List<bool> Q3Val = [
    false,
    false,
  ];
  List<bool> Q3sol = [
    false,
    true,
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
      resizeToAvoidBottomInset: false,
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
                        crossAxisCount: 1,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(
                                    end: 20, bottom: 20),
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  ':	الوضعية  ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent),
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'تَمْلِكُ آمَالُ 488 دينَارًا. شَاهَدَت بِإحْدَى ٱلْمَغَازَات لُعْبَةً أعْجَبَتْهَا ثَمَنُهَا 276 دِينَارًا فَاِشْتَرَتْهَا',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.pink),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 20),
                                alignment: Alignment.center,
                                child: const Text(
                                  'أَخْتَارُ السُّؤالَ الْمُنَاسِبَ ',
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
                                  ' : للإجَابَةِ عَنْ السُّؤالِ الَّذِي اخْتَرْتُهُ أُنْجِزُ ',
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
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 230,
                                  width: 280,
                                  child: Image.asset('assets/images/kid1.png'),
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
