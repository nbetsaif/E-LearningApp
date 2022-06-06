import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../Day5.dart';

class Exercice552 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice552> {
  @override
  void initState() {
    super.initState();
  }



  double score = 0;
  int i = 0;

  List<String> Q1 = [
    '109=63-172',
    '120=63-183',
    '246=63+183',
  ];
  List<String> Q2 = [
    '120+172+183',
    '109+172+183',
    '246+120+63+183',
  ];
  List<String> Q3 = [
    'نَعَمْ تَكْفِي',
    'لَا تَكْفِي',
  ];

  List<bool> Q1Val = [false, false, false];
  List<bool> Q2Val = [false, false, false];
  List<bool> Q3Val = [false, false];
  List<bool> Q1ValSOL = [false, true, false];
  List<bool> Q2ValSOL = [true, false, false];
  List<bool> Q3ValSOL = [true, false];

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
        score += 1;
      });
    }
  }

  void CalculScoreQ3() {
    if (eq(Q3Val, Q3ValSOL)) {
      setState(() {
        score += 1;
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

                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        childAspectRatio: 1.2,
                        crossAxisCount: 1,
                        children: [
                          Column(

                            children: [
                              const Text(
                                ' الوضعية 1 ',
                                style: TextStyle(fontSize: 30, color: Colors.pink),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: const Text(
                                  'بِمُنَاسَبَةِ شَهْرِ الْمَدْرَسَةِ، سَاهَمَ الْمُدَرِسُونَ بِ 183 دِينَارًا وَٱلْأَوْلِيَاءُ بِـ172دِينَارًا، وَسَاهَمَتْ مُؤَسَّسَةٌ بِ 63 دِينَارًا أَقَلَّ مِنْ مُسَاهَمَةِ الْمُدَرِسِينَ لِتَهْيِئَةِ سَاحةِ ٱلْمَدْرَسَةِ بِ 495 دِينَارًا',
                                  style: TextStyle(fontSize: 25, color: Colors.black,),textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                child: const Text(
                                  'أَخْتَارُ الإِجَابَةَ الصَّحِيحَةَ',
                                  style: TextStyle(fontSize: 25, color: Colors.pink,),textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(

                                margin: const EdgeInsetsDirectional.only(
                                    top: 5, bottom: 20),
                                child: const Text('لِحِسَابِ مُسَاهَمَةَ ٱلْمُؤَسَّسَةِ بالدِّينَارِ',style: TextStyle(fontSize: 20,color: Colors.green),),
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
                                child: const Text('لِحِسَابِ جُمْلَةَ ٱلْمُسَاهَمَاتِ بالدِّينَار',style: TextStyle(fontSize: 20,color: Colors.green),),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height/7.5,
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
                                    top: 5, bottom: 20,end: 8),
                                child: const Text('هَلْ تَكْفِي جُمْلَةُ ٱلْمُسَاهَمَاتِ لِتَهْيِئَةِ ٱلسَّاحَةِ ؟',style: TextStyle(fontSize: 20,color: Colors.green),),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: MediaQuery.of(context).size.height/5,
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
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors
                                .pink),
                            onPressed: () {
                              CalculScoreQ1();
                              CalculScoreQ2();
                              CalculScoreQ3();
                              setState(() {
                                daystate.i = 1;
                                daystate.refresh(score.toDouble());
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
