import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Day6.dart';


class Exercice661 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice661> {
  @override
  void initState() {
    clearText1();
    clearText2();
    clearText3();
    clearText4();
    super.initState();
  }

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  String reponseQ1 = '';

  void clearText1() {
    myController1.clear();
  }
  String reponseQ2 = '';
  void clearText2() {
    myController2.clear();
  }
  String reponseQ3 = '';
  void clearText3() {
    myController3.clear();
  }
  String reponseQ4 = '';
  void clearText4() {
    myController4.clear();
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

  void CalculScoreQ1() {
    if (reponseQ1 == '4') {
      setState(() {
        score++;
      });
    }
  }
  void CalculScoreQ2() {
    if (reponseQ2 == '3') {
      setState(() {
        score++;
      });
    }
  }

  void CalculScoreQ3() {
    if (reponseQ3 == '5') {
      setState(() {

        score++;
      });
    }
  }

  void CalculScoreQ4() {
    if (reponseQ4 == '4') {
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
                    Expanded(
                      child: GridView.count(

                        physics: const BouncingScrollPhysics(),
                        //childAspectRatio: 2 / 1,
                        crossAxisCount: 1,
                        childAspectRatio: 2,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsetsDirectional.only(end: 20),
                                child: const Text(
                                  'ألاحظ المضلّعات التّالية'
                                      ' وأكتب عدد أضلاعها',
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 80,
                                  width: 120,
                                  child: Image.asset('assets/images/fig8.png'),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  controller: myController1,
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

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 80,
                                  width: 120,
                                  child: Image.asset('assets/images/fig9.png'),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  controller: myController2,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 23,
                                      color: Colors.grey[500],
                                    ),
                                    hintText: 'الاجابة',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 80,
                                  width: 120,
                                  child: Image.asset('assets/images/fig3.png'),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  controller: myController3,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 23,
                                      color: Colors.grey[500],
                                    ),
                                    hintText: 'الاجابة',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsetsDirectional.only(top: 5),
                                  height: 80,
                                  width: 120,
                                  child: Image.asset('assets/images/fig13.png'),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.center,
                                  controller: myController4,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 23,
                                      color: Colors.grey[500],
                                    ),
                                    hintText: 'الاجابة',
                                  ),
                                  onChanged: (String rep) {
                                    setState(() {
                                      reponseQ4 = rep;
                                    });
                                  },
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
                            print(score);
                            CalculScoreQ1();
                            print(score);
                            CalculScoreQ2();
                            print(score);
                            CalculScoreQ3();
                            print(score);
                            CalculScoreQ4();
                            print(score);
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