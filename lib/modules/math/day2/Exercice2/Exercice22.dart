import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../day2/Day2.dart';



class Exercice222 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice222> {
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

  List<String> Q2 = [
    'المبلغ المتبقي= ثمن الدراجة- مايملكه أحمد',
    'المبلغ المتبقي= ثمن الدراجة+ مايملكه أحمد',
    'المبلغ المتبقي= مايملكه أحمد- ثمن الدراجة',
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
                        childAspectRatio: 1.45,
                          crossAxisCount: 1,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsetsDirectional.only(end: 20, bottom: 20),
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      ':	الوضعية 2 ',
                                      style:
                                      TextStyle(fontSize: 20, color: Colors.blueAccent),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(bottom: 20),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'توجه أحمد نحو دكّان بيع الدّرّاجات وفي جيبه 384 دينارا أعجبته درّاجة بـ 222 دينارا ',
                                      style: TextStyle(fontSize: 20, color: Colors.pink),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height/20,
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
                                  'أبحث عن المبلغ المتبقي لأحمد ',
                                  style: TextStyle(fontSize: 20, color: Colors.pink),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                  textAlign: TextAlign.center,
                                  controller: myController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                    hintText: 'الإجابة',
                                  ),
                                  onChanged: (String rep) {
                                    setState(() {
                                      reponseQ1 = rep;
                                    });
                                  },
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      top: 5, bottom: 20),
                                  height: MediaQuery.of(context).size.height/6,
                                  width: MediaQuery.of(context).size.height/3.1,
                                  child: Image.asset('assets/images/kid2.png'),
                                ),
                              )
                            ],
                          )


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            if (reponseQ1 == "162") score+=2;
                            CalculScoreQ2();
                            setState(() {
                              daystate.i = 1;
                              daystate.refresh(score.toDouble());
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('أنهيت')),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
