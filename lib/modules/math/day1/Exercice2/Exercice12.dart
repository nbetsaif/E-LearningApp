import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../day1/Day1.dart';

class Exercice112 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice112> {
  @override
  void initState() {
    clearText();
    super.initState();
  }

  List<String> Q2 = [
    'سَأَبْحَثُ عَنْ ثَمَنِ الدَّرَّاجَةِ بالدّينار:  184+122 =306',
    'سَأَبْحَثُ عَنْ الْمَبْلَغِ الْمَالِي الّذِي يَمْلِكُهُ أحْمَدُ بالدّينار:  184+122 =306',
    'سَأَبْحَثُ عَنْ الْمَبْلَغِ الْمَالِي الّذِي بَقِيَ لأحْمَدَ بالدّينار:  184+122 =306 ',
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

  List<String> question1 = ['432', '423', '342', '324', '234', '243'];
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();

  String reponseQ1 = '';
  String reponseQ2 = '';
  String reponseQ3 = '';
  String reponseQ4 = '';
  String reponseQ5 = '';
  String reponseQ6 = '';
  void clearText() {
    myController.clear();
    myController1.clear();
    myController2.clear();
    myController3.clear();
    myController4.clear();
    myController5.clear();
  }

  double score = 0;
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
              duration: const Duration(milliseconds: 600),
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
                      margin: EdgeInsetsDirectional.only(end: 10, start: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        '		أُكون كل الأعداد التي تتكون من ثلاثة أرقام انطلاقا من الأرقام 4 ،2 ،3 دون تكرار نفس العدد.',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
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
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
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
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController2,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
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
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                                hintText: 'الإجابة',
                              ),
                              onChanged: (String rep) {
                                setState(() {
                                  reponseQ4 = rep;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController4,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                                hintText: 'الإجابة',
                              ),
                              onChanged: (String rep) {
                                setState(() {
                                  reponseQ5 = rep;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              controller: myController5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                                hintText: 'الإجابة',
                              ),
                              onChanged: (String rep) {
                                setState(() {
                                  reponseQ6 = rep;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10, start: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        ':الوضعية ',
                        style:
                        TextStyle(fontSize: 20, color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10, start: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        '		تَوَجَّهَ أَحْمدُ نَحْوَ دُكَّانِ بَيْعِ الدَّرَّاجَاتِ وَفِي جَيْبِهِ مَبْلَغٌ مِنَ الْمَالِ. أَعْجَبَتْهُ دَرَّاجَةٌ بِـ184دينَارًا فَاشْتَرَاهَا وَأَرْجَعَ لَهُ الْبَائِعُ 122 دينَارًا',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {
                              if (question1.contains(reponseQ1))
                                score = score + 0.5;
                              if (question1.contains(reponseQ2))
                                score = score + 0.5;
                              if (question1.contains(reponseQ3))
                                score = score + 0.5;
                              if (question1.contains(reponseQ4))
                                score = score + 0.5;
                              if (question1.contains(reponseQ5))
                                score = score + 0.5;
                              if (question1.contains(reponseQ6))
                                score = score + 0.5;
                              CalculScoreQ2();
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
