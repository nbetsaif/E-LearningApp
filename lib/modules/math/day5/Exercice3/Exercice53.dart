import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Day5.dart';

class Exercice553 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice553> {
  @override
  void initState() {
    super.initState();
  }

  String reponseQ1 = '';


  double score = 0;
  int i = 0;

  List<String> Q1 = [
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الْكَبِيرَةِ',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الْكَبِيرَةِ  - كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الصَّغِيرةِ',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الْكَبِيرَةِ  + كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الصَّغِيرةِ',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الصَّغِيرةِ'
  ];
  List<String> Q2 = [
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الْكَبِيرَةِ  ',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كَمِيَّةِ ٱلْعِطْرِشَاءِ ٱلْمُتَبَقِيةِ',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا + كَمِيَّةِ ٱلْعِطْرِشَاءِ بِٱلْقَوَارِير',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كَمِيَّةِ ٱلْعِطْرِشَاءِ بِٱلْقَوَارِير',
    'كِمِّيَةُ ٱلْعِطْرِشَاءِ الْمُتَحَصَّلِ عَلَيْهَا - كِمِّيَةُ ٱلْعِطْرِشَاءِ فِي القَوَارِيرِ الصَّغِيرةِ  '
  ];

  List<bool> Q1Val = [false, false, false,false];
  List<bool> Q2Val = [false, false, false,false, false];

  List<bool> Q1ValSOL = [false, false, true,false];
  List<bool> Q2ValSOL = [false, false, false,true, false];

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
        score += 2;
      });
    }
  }

  void CalculScoreQ2() {
    if (eq(Q2Val, Q2ValSOL)) {
      setState(() {
        score += 2;
      });
    }
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
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio: 1/1.33,
                      crossAxisCount: 1,
                      children: [

                        Column(

                          children: [
                            const Text(
                              ' الوضعية 2 ',
                              style: TextStyle(fontSize: 30, color: Colors.pink),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const Text(
                                'تَحَصَّلَتْ ٱلْعَمَّةُ خَدِيجَةُ مِنْ تَقْطِيرِ صَابَتِهَا مِنَ ٱلْعِطْرِشَاءِ عَلَى 248 لِتْرًا،فَصَبَّتْ مِنْهَا 94 لِتْرًا فِي قَوَارِيرَ كَبِيرَةٍ وَ 129 لِتْرًا فِي قَوَارِيرَ صَغِيرَةٍ.',
                                style: TextStyle(fontSize: 25, color: Colors.black,),textAlign: TextAlign.right,
                              ),
                            ),
                            Container(
                              height: 280,
                              decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/kid1.png'))
                            ),)
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  top: 5, bottom: 20),
                              child: const Text('لِأَبْحَثَ عَنْ كَمِيَّةِ ٱلْعِطْرِشَاءِ بِٱلْقَوَارِيرَ',style: TextStyle(fontSize: 20,color: Colors.green),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height/8,
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
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  top: 5, bottom: 20,end: 5),
                              child: const Text('لِأَبْحَثَ عَنْ كَمِيَّةِ ٱلْعِطْرِشَاءِ ٱلْمُتَبَقِيةَِ',style: TextStyle(fontSize: 20,color: Colors.green),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height/8,
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
                          CalculScoreQ1();
                          CalculScoreQ2();
                          setState(() {
                            daystate.i = 2;
                            daystate.refresh(score);
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