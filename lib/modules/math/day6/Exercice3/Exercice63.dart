import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Day6.dart';

class Exercice663 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice663> {
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

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  String reponseQ1 = '';
  String reponseQ2 = '';
  String reponseQ3 = '';

  void clearText() {
    myController1.clear();
    myController2.clear();
    myController3.clear();
  }

  void CalculScoreQ1() {
    if ('7'==reponseQ1) {
      setState(() {
        score+=2;
      });
    }
  }
  void CalculScoreQ2() {
    if ('7'==reponseQ2) {
    setState(() {
      score+=1;
    });
  }
  }
  void CalculScoreQ3() {
    if ('1'==reponseQ3) {
      setState(() {
        score+=1;
      });
    }
  }


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
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio: 1/1.33,
                      crossAxisCount: 1,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20, top: 64,start: 20),
                              child: const Text(
                                'أكتب عدد المثلّثات والرّباعيات والخماسيّات الموجودة في الرّسم التّاليُُ',
                                style: TextStyle(fontSize: 20,color: Colors.pink,),textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Image.asset('assets/images/fig15.jpg'),
                            ),
                            Row(
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width* 0.61,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                  padding: const EdgeInsets.only(right: 20,),
                                    child: const Text(': المثلثات ',style: TextStyle(fontSize: 22),))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width* 0.61,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController2,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                Container(
                                    padding: const EdgeInsets.only(right: 20,),
                                    child: const Text(': الرّباعيات ',style: TextStyle(fontSize: 22),))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width* 0.58,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlign: TextAlign.center,
                                    controller: myController3,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                Container(
                                    padding: const EdgeInsets.only(right: 20,),
                                    child: const Text(': الخماسيّات',style: TextStyle(fontSize: 22),))
                              ],
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
                          CalculScoreQ3();
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