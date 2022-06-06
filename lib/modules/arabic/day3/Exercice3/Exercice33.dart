import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day3/Text.dart';


import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day3.dart';

class Exercice33 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice33> {
  bool visible = false;
  double bottom = 0;
  double top = 0;
  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  int score = 0;

  List<String> Q4 = [
    'يُفرِغُ الخَبّازُ الدَّقيقَ في المَخْبَزَةِ',
    'يُضيفُ المِلحَ وَ الخَميرَةَ',
    'يَسكُبُ عَليْها الماء الفاتِرَ',
    'يَضْغَطُ عَلى الزِّرِ لِيُحَرِّكَ الخَلِيطَ',
    'يُقَسّمه إلى أَرْغِفَةِِ مُسْتَدِيرَةٍ',
    'يُلقِي بِها بَعدَ أَنْ ٱخْتَمَرَتْ فِي الفُرْنِ'
  ];
  List<String> Q4S = [
    'يَسكُبُ عَليْها الماء الفاتِرَ',
    'يُفرِغُ الخَبّازُ الدَّقيقَ في المَخْبَزَةِ',
    'يُضيفُ المِلحَ وَ الخَميرَةَ',
    'يُقَسّمه إلى أَرْغِفَةِِ مُسْتَدِيرَةٍ',
    'يَضْغَطُ عَلى الزِّرِ لِيُحَرِّكَ الخَلِيطَ',
    'يُلقِي بِها بَعدَ أَنْ ٱخْتَمَرَتْ فِي الفُرْنِ'
  ];
  void Visible() {
    visible = true;
  }

  Function eq = const ListEquality().equals;
  void CalculScoreQ4() {
    if (eq(Q4S, Q4)) {
      setState(() {
        score = score + 4;
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
                    child: Column(
                      children: [
                        Container(
                          margin:
                          const EdgeInsetsDirectional.only(end: 8, bottom: 20),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            ' : أُرَتِّبُ الأعمالَ الَّتي يَقومُ بِها الخَبَّاز',
                            style: TextStyle(fontSize: 20,color: Colors.pink),
                          ),
                        ),
                        Expanded(
                          child: ReorderableListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 40),
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  height: MediaQuery.of(context).size.height/13,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      color: Colors.blueAccent,
                                    boxShadow: [BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey[400]!,
                                        offset: const Offset(-2,-2,)
                                    ),BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey[400]!,
                                        offset: const Offset(2,2,)
                                    )]
                                  ),
                                  key: Key('$index'),
                                  child: Center(
                                      child: Text(
                                        Q4[index],
                                        style: const TextStyle(fontSize: 22,color: Colors.white),
                                      )),
                                );
                              },
                              itemCount: Q4.length,
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  if (oldIndex < newIndex) {
                                    newIndex -= 1;
                                  }
                                  final String item = Q4.removeAt(oldIndex);
                                  Q4.insert(newIndex, item);
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.pink),
                        onPressed: () {
                          CalculScoreQ4();
                          setState(() {
                            daystate3.i = 2;
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
    );
  }
}
/**/
