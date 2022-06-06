import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day4/Text.dart';


import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day4.dart';

class Exercice41 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice31State createState() => _Exercice31State();
}

class _Exercice31State extends State<Exercice41> {
  bool visible = false;
  double bottom = 0;
  double top = 0;
  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  int score = 0;

  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (!eq(Q2Val, Q2sol)) {
      setState(() {
        score+=2;
      });
    }
  }


  void CalculScoreQ4() {
    if (eq(Q4Val, Q4ValSOL)) {
      setState(() {
        score+=2;
      });
    }
  }

  List<String> Q2 = [
    'إلى المنزل',
    'إلى المدرسةَ',
    'إلى الحديقةِ',
    'لى المحمية ِ',
    'إلى مدينة األلعاب ',
  ];
  List<bool> Q2Val = [false, false, false, false, false];
  List<bool> Q2sol = [false, false, true, false, false];


  List<String> Q4 = [
    'حَدِيقَةُ ٱلْمَنْزِلِ',
    'حَدِيقَةُ ٱلْمَدْرَسَةِ',
    'اَلْحَدِيقَةُ ٱلْعُمُومِيَّةُ',
    'اَلْغُرْفَةُِ',
  ];
  List<bool> Q4Val = [false, false, false, false];
  List<bool> Q4ValSOL = [true, false, false, false];

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Hero(
                        tag: "text",
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                HeroDialogRoute(
                                    builder: (context) => const Text4()));
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
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio:1.25,
                      crossAxisCount: 1,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 10),
                              child: const Text(
                                'أين تخرج في نزهة؟',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 10,),
                              child: const Text(
                                ' ماهو الإطار المكاني للنص ؟',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
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
                          CalculScoreQ4();
                          setState(() {
                            daystate4.i = 0;
                            daystate4.refresh(score + 0.0);
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
