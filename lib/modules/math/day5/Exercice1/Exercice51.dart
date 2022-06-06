import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../Day5.dart';



class Exercice551 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice551> {
  @override
  void initState() {
    super.initState();
  }

  @override
  List<String> Q1 = ['300+24', '300+20+4'];
  List<String> Q2 = ['3+20+200', '23+200'];
  List<String> Q3 = ['7+50+300', '300+57', '7+350'];
  List<String> Q4 = ['100+89', '100+80+9', '9+180'];

  List<bool> Q1Val = [false, false];
  List<bool> Q2Val = [false, false];
  List<bool> Q3Val = [false, false, false];
  List<bool> Q4Val = [false, false, false];

  List<bool> Q1ValSOL = [true, false];
  List<bool> Q2ValSOL = [false, true];
  List<bool> Q3ValSOL = [true, false, false];
  List<bool> Q4ValSOL = [false, true, false];
  int score = 0;
  int i = 0;


  Function eq = const ListEquality().equals;

  void CalculScoreQ1() {
    if (eq(Q1Val, Q1ValSOL)) {
      setState(() {
        score += 1;
      });
    }
  }

  void CalculScoreQ2() {
    if (eq(Q1Val, Q1ValSOL)) {
      setState(() {
        score += 1;
      });
    }
  }

  void CalculScoreQ3() {
    if (eq(Q1Val, Q1ValSOL)) {
      setState(() {
        score += 1;
      });
    }
  }

  void CalculScoreQ4() {
    if (eq(Q1Val, Q1ValSOL)) {
      setState(() {
        score += 1;
      });
    }
  }

  bool visible = false;
  double bottom = 0;
  double top = 0;

  @override
  void call() {
    top = 30;
    bottom = 600;
  }


  void Visible() {
    visible = true;}


    @override
    Widget build(BuildContext context) {
      final Map Exercice = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map;
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 150),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'التَّفْكِيكُ إِلَى مِئَاتٍ وَٱلْبَاقِي',
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(

                          physics: const BouncingScrollPhysics(),
                          //childAspectRatio: 2 / 1,
                          crossAxisCount: 2,
                          children:
                          [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        top: 5, bottom: 20),
                                    child: const Text('324= ',style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height/10,
                                        child: ListTile(
                                          title: Text(
                                            Q1[index],
                                            textAlign: TextAlign.end,
                                          ),
                                          trailing: Checkbox(
                                              value: Q1Val[index],
                                              onChanged: (val) {
                                                setState(() {
                                                  Q1Val[index] = val!;
                                                });
                                              }),
                                        ),
                                      );
                                    },
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: Q1.length,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        top: 5, bottom: 20),
                                    child: const Text('223= ',style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height/10,
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
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'التَّفْكِيكُ وَفْقَ ٱلصِيغَةِ ٱلْقَانُونِيَّةِ',
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(

                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1/2,
                          crossAxisCount: 2,
                          children:
                          [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        top: 5, bottom: 20),
                                    child: const Text('357= ',style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(child: ListTile(
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
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Container(
                                    margin: const EdgeInsetsDirectional.only(
                                        top: 5, bottom: 20),
                                    child: const Text('189= ',style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        child: ListTile(
                                          title: Text(
                                            Q4[index],
                                            textAlign: TextAlign.end,
                                          ),
                                          trailing: Checkbox(
                                              value: Q4Val[index],
                                              onChanged: (val) {
                                                setState(() {
                                                  Q4Val[index] = val!;
                                                });
                                              }),
                                        ),
                                      );
                                    },
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: Q4.length,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors
                                .pink),
                            onPressed: () {
                              CalculScoreQ1();
                              CalculScoreQ2();
                              CalculScoreQ3();
                              CalculScoreQ4();
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