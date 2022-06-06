import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../day3/Day3.dart';


class Exercice331 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice331> {
  @override
  void initState() {
    clearText();
    super.initState();
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  String reponseQ1 = '';
  String reponseQ2 = '';
  String reponseQ3 = '';
  void clearText() {
    myController.clear();
    myController1.clear();
    myController2.clear();
  }

  List<String> Q2 = [
    '253 < 456',
    '258 > 320',
    '253 > 105',
    '243 < 204',
  ];
  List<bool> Q2Val = [
    false,
    false,
    false,
    false,
  ];
  List<bool> Q2sol = [
    true,
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
                    Expanded(
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        childAspectRatio: 1.5,
                        crossAxisCount: 1,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 10),
                                alignment: Alignment.center,
                                child: const Text(
                                  'أختار المقارنة الصحيحة ',
                                  style: TextStyle(fontSize: 20, color: Colors.pink),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (BuildContext context, int index) {
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
                                margin: EdgeInsetsDirectional.only(bottom: 10),
                                height: MediaQuery.of(context).size.height/10,
                                alignment: Alignment.center,
                                child: const Text(
                                  'أُنْجِزُ الْعَمَلِيَّاتِ التَّالِيَةَ',
                                  style: TextStyle(fontSize: 20, color: Colors.pink),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/cal3.png'),
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.allow(
                                                    RegExp(r'[0-9]')),
                                              ],
                                              textAlign: TextAlign.center,
                                              controller: myController2,
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[500],
                                                ),
                                                hintText: 'الإجابة',
                                              ),
                                              onChanged: (String rep) {
                                                setState(() {
                                                  reponseQ3 = rep;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/cal2.png'),
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.allow(
                                                    RegExp(r'[0-9]')),
                                              ],
                                              textAlign: TextAlign.center,
                                              controller: myController1,
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[500],
                                                ),
                                                hintText: 'الإجابة',
                                              ),
                                              onChanged: (String rep) {
                                                setState(() {
                                                  reponseQ2 = rep;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/cal1.png'),
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.allow(
                                                    RegExp(r'[0-9]')),
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
                                        ],
                                      ),
                                    ),
                                  ],
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
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            if (reponseQ1 == "140") score++;
                            if (reponseQ2 == "210") score++;
                            if (reponseQ3 == "321") score++;
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
