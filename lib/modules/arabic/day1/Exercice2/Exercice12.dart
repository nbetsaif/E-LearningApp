import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day.dart';
import '../Text.dart';


class Exercice12 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice12> {
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

  int score = 0;
  int i = 0;

  List<String> Q2 = ['الأم', 'أريج', 'الجدة', 'الأب', 'زياد'];
  List<String> Q3 = ['صواب', 'خطأ'];
  List<String> Q4 = [
    'العناية الدائمة بحديقة المنزل',
    'زيارة منزل الجدة',
    'سقي المغروسات باستعمال خرطوم الماء',
    'استعمال المرش بدل الخرطوم للحفاظ على التربة والماء',
  ];

  List<bool> Q2Val = [false, false, false, false, false];
  List<bool> Q2ValSOL = [false, true, false, true, true];
  List<bool> Q3Val = [false, false];
  List<bool> Q3ValSOL = [true, false];
  List<bool> Q4Val = [false, false, false, false];
  List<bool> Q4ValSOL = [true, false, true, true];
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

  void CalculScoreQ1() {
    if (reponseQ1 == 'الحديقة') {
      setState(() {
        score++;
      });
    }
  }

  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (eq(Q2Val, Q2ValSOL)) {
      setState(() {
        score++;
      });
    }
  }

  void CalculScoreQ3() {
    if (eq(Q3Val, Q3ValSOL)) {
      setState(() {
        score++;
      });
    }
  }

  void CalculScoreQ4() {
    if (eq(Q4Val, Q4ValSOL)) {
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
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 15),
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
                                        builder: (context) => const Text1()));
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
                                margin: const EdgeInsetsDirectional.only(end: 30),
                                child: const Text(
                                  'ما هو اإلطار المكاني الذي دارت فيه أحداث النص؟',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                controller: myController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 23,
                                    color: Colors.grey[500],
                                  ),
                                  hintText: 'الاجابة',
                                ),
                                onChanged: (String rep) {
                                  setState(() {
                                    reponseQ1 = rep;
                                  });
                                },
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 290,
                                  width: 280,
                                  child: Image.asset('assets/images/kid1.png'),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsetsDirectional.only(end: 20),
                                child: const Text(
                                  'أضع العلامة أمام شخصيات النص',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
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
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 20),
                                      child: Text(
                                        '  : ِأجيب بصواب أو خطأ',
                                        style: TextStyle(fontSize: 20,color: Colors.pink),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 30),
                                      child: Text(
                                        'دَارت أحْدَاثُ النص في الصّباحِ',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
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
                                  height: 200,
                                  width: 200,
                                  child: Image.asset('assets/images/kid2.png'),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          end: 20),
                                      child: Text(
                                        '  : ِأنقر على األحداث الموافقة للنص',
                                        style: TextStyle(fontSize: 20,color: Colors.pink),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height/8,
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
                              )
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
                            CalculScoreQ1();
                            CalculScoreQ2();
                            CalculScoreQ3();
                            CalculScoreQ4();

                            setState(() {
                              daystate.i = 1;
                              daystate.refresh(score + 0.0);
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