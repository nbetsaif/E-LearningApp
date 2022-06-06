import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../day1/Day1.dart';

class Exercice113 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice113> {
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
                        '		فِي مَعْرَضٍ لِلصِنَاعَاتِ ٱلتَّقِلِيدِيَّةِ رُصِدَتْ جَوَائِزُ لِلزَّائِرينَ حَسَبَ ٱلْعَدَدِ ٱلْمُسَجَّلِ عَلَى تَذْكِرَةِ ٱلدُّخُولِ. يُبيِنُ جَدْوَل الآتِي عَدَدَ كُلِ تَذْكِرَةٍ فائِزةٍ..',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10, start: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'أكتب العدد بالأرْقامِ ',
                        style:
                        TextStyle(fontSize: 20, color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      'رَقْمُ آحَادِهَا 7 عَدَدُ عَشَرَاتِهَا 45ُِ',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      'رَقْمُ آحَادِهَا 5 وَرَقْمُ مِئاتِهَا 3 وَرَقْمُ عَشَرَاتِهَا 2ُِ',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController2,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      'رَقْمُ مِئَاتِهَا 4 وَرَقْمُ عَشَرَاتِهَا 1 وَرَقْمُ آحَادِهَا5 ُِ',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {
                              if (reponseQ1 == '457') score+=2;
                              if (reponseQ2 == '325') score++;
                              if (reponseQ3 == '415') score++;
                              setState(() {
                                daystate.i = 2;
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
