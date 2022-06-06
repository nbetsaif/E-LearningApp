import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day4/Text.dart';

import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day4.dart';

class Exercice43 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice43> {
  bool visible = false;
  double bottom = 0;
  double top = 0;
  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  int score = 0;

  void Visible() {
    visible = true;
  }

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
          SingleChildScrollView(
            child: Visibility(
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
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsetsDirectional.only(
                              end: 20),
                          child: const Text(
                            ' عبر عن كل حدث بجملة',
                            style: TextStyle(fontSize: 20,color: Colors.pink),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: myController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[500],
                                  ),
                                  hintText: '',
                                ),
                                onChanged: (String rep) {
                                  setState(() {
                                    reponseQ1 = rep;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsetsDirectional.only(start: 20, end: 6),
                              child: const Text(
                                'اعتذار األم عما بدر من ابنتها *',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
                              margin:
                              const EdgeInsetsDirectional.only(start: 20, end: 12),
                              child: const Text(
                                'انشغال رحمة باللعب *',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
                              margin:
                              const EdgeInsetsDirectional.only(start: 20, end: 15),
                              child: const Text(
                                ' اصطحاب سميرة ابنتها رحمة إلى الحديقة *',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
                              margin:
                              const EdgeInsetsDirectional.only(start: 20, end: 25),
                              child: const Text(
                                ' تجمع الأطفال حول الحارس حائرين *',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
                              margin:
                              const EdgeInsetsDirectional.only(start: 20, end: 10),
                              child: const Text(
                                'اعتراف رحمة بخطئها  *',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            if (reponseQ1 == 'اعتذرت األم عما بدر من ابنتها') {
                              score++;
                            }
                            if (reponseQ2 == 'انشغلت رحمة باللعب') score++;
                            if (reponseQ3 ==
                                'اصطحبت سميرة ابنتها رحمة إلى الحديقة') score++;
                            if (reponseQ4 == 'تجمع األطفال حول الحارس حائرين') {
                              score++;
                            }
                            if (reponseQ5 == 'اعترفت رحمة بخطئها') score++;

                            setState(() {
                              daystate4.i = 2;
                              daystate4.refresh(score + 0.0);
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('أنهيت')),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/**/
