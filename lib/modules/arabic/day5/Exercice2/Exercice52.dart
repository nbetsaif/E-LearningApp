import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day5/Text.dart';

import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day5.dart';

class Exercice52 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice31State createState() => _Exercice31State();
}

class _Exercice31State extends State<Exercice52> {
  bool visible = false;
  double bottom = 0;
  double top = 0;
  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  double score = 0;

  @override
  void initState() {
    clearText();
    super.initState();
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  String reponseQ1 = '';
  String reponseQ2 = '';
  String reponseQ3 = '';
  String reponseQ4 = '';
  String reponseQ5 = '';
  void clearText() {
    myController.clear();
    myController1.clear();
    myController2.clear();
    myController3.clear();
    myController4.clear();
  }

  Function eq = const ListEquality().equals;

  void CalculScoreQ4() {
    if (eq(Q4Val, Q4ValSOL)) {
      setState(() {
        score+=1.5;
      });
    }
  }

  List<String> Q4 = [
    'مروىِ',
    'الجّدة ِ',
    'صاحب البستانُ',
    'دحدوح',
    'الأم',
    'مروان',
    'إخوة دحدوح',
  ];
  List<bool> Q4Val = [false, false, false, false, false, false, false];
  List<bool> Q4ValSOL = [true, false, true, true, true, true, false];

  void Visible() {
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    final Map Exercice = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: Stack(
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
                                      builder: (context) => const Text5()));
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
                                        fontSize: 20, color: Colors.pinkAccent),
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
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20),
                              child: const Text(
                                'ما هو الإطار المكاني ؟',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
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
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(top: 10),
                              height: MediaQuery.of(context).size.height/3,
                              width: 400,
                              child: Image.asset('assets/images/kid1.png'),
                            )
                          ],
                        ),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20),
                              child: const Text(
                                'أكتب صواب أم خطأ',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            const SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: myController1,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[500],
                                      ),
                                      hintText: '',
                                    ),
                                    onChanged: (String rep) {
                                      setState(() {
                                        reponseQ2 = rep;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      start: 20, end: 20),
                                  child: const Text(
                                    'دارت أحداث الن ص في المساء *',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: myController2,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[500],
                                      ),
                                      hintText: '',
                                    ),
                                    onChanged: (String rep) {
                                      setState(() {
                                        reponseQ3 = rep;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      start: 20, end: 28),
                                  child: const Text(
                                    ' دارت أحداث النص في صباح ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: myController3,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[500],
                                      ),
                                      hintText: '',
                                    ),
                                    onChanged: (String rep) {
                                      setState(() {
                                        reponseQ4 = rep;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      start: 20, end: 15),
                                  child: const Text(
                                    'ذات صباح" يمثل اإلطار الزماني للنص" ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: myController4,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[500],
                                      ),
                                      hintText: '',
                                    ),
                                    onChanged: (String rep) {
                                      setState(() {
                                        reponseQ5 = rep;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsetsDirectional.only(
                                      start: 20, end: 10),
                                  child: const Text(
                                    'ذات صباح" يمثل اإلطار المكاني للنص"',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20),
                              child: const Text(
                                ' : أختار شخصيات النّص',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height/15.5,
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
                          if (reponseQ1 == 'البستان') score+=0.5;
                          if (reponseQ2 == 'خطأ') score+=0.5;
                          if (reponseQ3 == 'صواب') score+=0.5;
                          if (reponseQ4 == 'صواب') score+=0.5;
                          if (reponseQ5 == 'خطأ') score+=0.5;
                          CalculScoreQ4();
                          setState(() {
                            daystate5.i = 1;
                            daystate5.refresh(score);
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
    );
  }
}
/**/
