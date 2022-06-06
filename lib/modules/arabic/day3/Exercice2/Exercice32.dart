import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day3/Text.dart';


import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day3.dart';

class Exercice32 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice32> {
  @override
  int score = 0;
  int i = 0;

  List<String> Q2 = ['النَّبتة', 'القُميحة ', 'الخَبّاز  ', 'الدّقيق'];
  List<String> Q3 = ['الرّبيع', 'الصّيف', 'الخريف', 'الشّتاء'];
  List<String> Q3A = ['', '', ''];
  List<String> Q3S = ['الشّتاء', 'الصّيف', 'الرّبيع'];

  List<bool> Q2Val = [false, false, false, false];
  List<bool> Q2ValSOL = [true, false, false, false];

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
  void CalculScoreQ2() {
    if (eq(Q2Val, Q2ValSOL)) {
      setState(() {
        score+=2;
      });
    }
  }

  void CalculScoreQ3() {
    if (eq(Q3A, Q3S)) {
      setState(() {
        score+=2;
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
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Hero(
                            tag: "text",
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    HeroDialogRoute(
                                        builder: (context) => const Text3()));
                              },
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.only(end: 8.0),
                                child: Container(
                                  width: 64,
                                  decoration: const BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: const Center(
                                    child: Text(
                                      'النَص',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pinkAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.only(end: 8.0),
                            child: Text(
                              " : إضغط هنا لقراءت النَص",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        //childAspectRatio: 2 / 1,
                        crossAxisCount: 1,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin:
                                const EdgeInsetsDirectional.only(end: 20),
                                child: const Text(
                                  'من الّتي برزت على سطح الأرض؟',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height/17,
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
                              Center(
                                child: SizedBox(
                                  height: 180,
                                  width: 200,
                                  child: Image.asset('assets/images/kid1.png'),
                                ),
                              )
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    top: 20, end: 20),
                                child: const Text(
                                  ': أَقرأُ النّصَّ وَ أُكملُ الجملَ بالفصلِ المُناسِبِ',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    LongPressDraggable(
                                      data: Q3[0],
                                      dragAnchorStrategy:
                                      pointerDragAnchorStrategy,
                                      feedback: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.black),
                                        child: Text(Q3[0]),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Center(
                                            child: Text(
                                              Q3[0],
                                              style: const TextStyle(fontSize: 20),
                                            )),
                                      ),
                                    ),
                                    LongPressDraggable(
                                      data: Q3[1],
                                      dragAnchorStrategy:
                                      pointerDragAnchorStrategy,
                                      feedback: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.black),
                                        child: Text(Q3[1]),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Center(
                                            child: Text(
                                              Q3[1],
                                              style: const TextStyle(fontSize: 20),
                                            )),
                                      ),
                                    ),
                                    LongPressDraggable(
                                      data: Q3[2],
                                      dragAnchorStrategy:
                                      pointerDragAnchorStrategy,
                                      feedback: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.black),
                                        child: Text(Q3[2]),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Center(
                                            child: Text(
                                              Q3[2],
                                              style: const TextStyle(fontSize: 20),
                                            )),
                                      ),
                                    ),
                                    LongPressDraggable(
                                      data: Q3[3],
                                      dragAnchorStrategy:
                                      pointerDragAnchorStrategy,
                                      feedback: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 40,
                                            color: Colors.black),
                                        child: Text(Q3[3]),
                                      ),
                                      child: Container(
                                        height: 40,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Center(
                                            child: Text(
                                              Q3[3],
                                              style: const TextStyle(fontSize: 20),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DragTarget(
                                          builder: (context, candidateItems,
                                              rejectedItems) {
                                            return Container(
                                              width: 64,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.purple,
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                    Q3A[0],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.pinkAccent),
                                                  )),
                                            );
                                          },
                                          onAccept: (String item) {
                                            setState(() {
                                              Q3A[0] = item;
                                            });
                                          },
                                        ),
                                        const Text(
                                          'يَزرَعُ الفلّاحُ القَمحَ في فَصل ',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DragTarget(
                                          builder: (context, candidateItems,
                                              rejectedItems) {
                                            return Container(
                                              width: 64,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.purple,
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                    Q3A[1],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.pinkAccent),
                                                  )),
                                            );
                                          },
                                          onAccept: (String item) {
                                            setState(() {
                                              Q3A[1] = item;
                                            });
                                          },
                                        ),
                                        Container(
                                          child: const Text(
                                            ' يَحصِدُ الفلّاحُ القَمحَ في فَصل',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DragTarget(
                                          builder: (context, candidateItems,
                                              rejectedItems) {
                                            return Container(
                                              width: 64,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.purple,
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                    Q3A[2],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.pinkAccent),
                                                  )),
                                            );
                                          },
                                          onAccept: (String item) {
                                            setState(() {
                                              Q3A[2] = item;
                                            });
                                          },
                                        ),
                                        Container(
                                          child: const Text(
                                            ' تَظهَرُ السّنابِلُ فَوقَ الأَرضِ في فَصل',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 110,
                                      width: 200,
                                      child: Image.asset('assets/images/kid2.png'),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                          // Question3(),
                          // Question4(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            CalculScoreQ2();
                            CalculScoreQ3();
                            setState(() {
                              daystate3.i = 1;
                              daystate3.refresh(score + 0.0);
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
