import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day2/Text.dart';

import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day2.dart';

class Exercice21 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice21> {
  @override
  int score = 0;
  int i = 0;
  List<String> Q2 = ['الطائرة', 'السيارة', 'القطار', 'الباخرة'];
  List<bool> Q2Val = [false, false, false, false];
  List<bool> Q2ValSOL = [false, false, false, false];
  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (!eq(Q2Val, Q2ValSOL)) {
      setState(() {
        score++;
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
                                        builder: (context) => const Text2()));
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
                        crossAxisCount: 1,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsetsDirectional.only(end: 20),
                                child: const Text(
                                  'في أي وسيلة نقل تو ّد ال َّسفَر؟',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height/7.2,
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
                            setState(() {
                              daystate2.i = 0;
                              daystate2.refresh(score + 0.0);
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
