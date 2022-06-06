import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../Day6.dart';



class Exercice662 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice662> {
  @override
  void initState() {
    clearText();
    super.initState();
  }

  final myController = TextEditingController();
  String reponseQ1 = '';
  void clearText() {
    myController.clear();
  }

  double score = 0;
  int i = 0;

  List<String> Q1 = ['ثلاثي', 'رباعي', 'خماسي',];
  List<String> Q2 = ['ثلاثي', 'رباعي', 'خماسي',];
  List<String> Q3 = ['ثلاثي', 'رباعي', 'خماسي',];
  List<String> Q4 = ['ثلاثي', 'رباعي', 'خماسي',];
  List<String> Q5 = ['ثلاثي', 'رباعي', 'خماسي',];
  List<String> Q6 = ['ثلاثي', 'رباعي', 'خماسي',];

  List<bool> Q1Val = [false, false, false];
  List<bool> Q2Val = [false, false, false];
  List<bool> Q3Val = [false, false, false];
  List<bool> Q4Val = [false, false, false];
  List<bool> Q5Val = [false, false, false];
  List<bool> Q6Val = [false, false, false];
  List<bool> Q1ValSOL = [false, false, true];
  List<bool> Q2ValSOL = [true,false, false];
  List<bool> Q3ValSOL = [false, false, true];
  List<bool> Q4ValSOL = [false, true, false];
  List<bool> Q5ValSOL = [false, true, false];
  List<bool> Q6ValSOL = [true, false, false];
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
  Function eq = const ListEquality().equals;
  void CalculScoreQ1() {
    if (eq(Q1Val, Q1ValSOL)) {
      setState(() {
        score+=0.5;
      });
    }
  }


  void CalculScoreQ2() {
    if (eq(Q2Val, Q2ValSOL)) {
      setState(() {
        score+=0.5;
      });
    }
  }

  void CalculScoreQ3() {
    if (eq(Q3Val, Q3ValSOL)) {
      setState(() {
        score+=0.5;
      });
    }
  }

  void CalculScoreQ4() {
    if (eq(Q4Val, Q4ValSOL)) {
      setState(() {
        score+=0.5;
      });
    }
  }

  void CalculScoreQ5() {
    if (eq(Q5Val, Q5ValSOL)) {
      setState(() {
        score++;
      });
    }
  }

  void CalculScoreQ6() {
    if (eq(Q6Val, Q6ValSOL)) {
      setState(() {
        score++;
      });
    }
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
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'صنّف الأشكال التالية حسب المطلوب',
                        style: TextStyle(fontSize: 20,color: Colors.pink),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        childAspectRatio: 1 / 1.7,
                        crossAxisCount: 2,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 5, bottom: 20),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig1.png'),
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
                                      top: 5, bottom: 20,),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig2.png'),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 5, bottom: 20),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig3.png'),
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
                                    top: 5, bottom: 20,),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig4.png'),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 5, bottom: 20),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig5.png'),
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
                                          Q5[index],
                                          textAlign: TextAlign.end,
                                        ),
                                        trailing: Checkbox(
                                            value: Q5Val[index],
                                            onChanged: (val) {
                                              setState(() {
                                                Q5Val[index] = val!;
                                              });
                                            }),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: Q5.length,
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
                                    top: 5, bottom: 20,),
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/images/fig6.png'),
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
                                          Q6[index],
                                          textAlign: TextAlign.end,
                                        ),
                                        trailing: Checkbox(
                                            value: Q6Val[index],
                                            onChanged: (val) {
                                              setState(() {
                                                Q6Val[index] = val!;
                                              });
                                            }),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: Q6.length,
                                ),
                              ),
                            ],
                          ),

                          // Question3(),
                          // Question4(),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {
                              CalculScoreQ1();
                              CalculScoreQ2();
                              CalculScoreQ3();
                              CalculScoreQ4();
                              CalculScoreQ5();
                              CalculScoreQ6();
                              setState(() {
                                daystate.i = 1;
                                daystate.refresh(score);
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