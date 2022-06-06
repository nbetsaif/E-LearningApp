import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../day1/Day1.dart';

class Exercice111 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice111> {
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
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 150),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '	أضع الأعداد التالية تحت صورة المعداد المناسب ',
                        style: TextStyle(fontSize: 20, color: Colors.pink),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Center(
                              child: Text(
                                '150',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Center(
                              child: Text(
                                '203',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Center(
                              child: Text(
                                '357',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Image.asset('assets/images/me3ded2.png')),
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
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(child: Image.asset('assets/images/me3ded1.png')),
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                              child: Image.asset('assets/images/me3ded3.png')),
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
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            if (reponseQ1 == '357') score++;
                            if (reponseQ2 == '150') score++;
                            if (reponseQ3 == '203') score+=2;
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
