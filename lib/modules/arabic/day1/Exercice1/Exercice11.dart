import 'package:flutter/material.dart';


import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day.dart';
import '../Text.dart';

class Exercice11 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice11State createState() => _Exercice11State();
}

class _Exercice11State extends State<Exercice11> {
  List<int> colorbox = [
    0XFF2196F3,
    0XFF2196F3,
    0XFF2196F3,
    0XFF2196F3,
    0XFF2196F3,
    0XFF2196F3,
  ];

  int score = 0;
  int i = 0;

  void changescore() {
    if (i == 1 || i == 2 || i == 3 || i == 5) {
      if (colorbox[i] == 0xFF9575CD) {
        score++;
      } else {
        score--;
      }
    } else {
      if (colorbox[i] == 0xFF9575CD) {
        score--;
      } else {
        score++;
      }
    }
  }

  void change() {
    if (colorbox[i] == 0xFF9575CD) {
      colorbox[i] = 0XFF2196F3;
    } else {
      colorbox[i] = 0xFF9575CD;
    }
  }

  List<String> answers = [
    '-	أكسر أغصان الأشجار',
    '-	أقلع الأعشاب الطفيلية',
    '-	أجمع الأوراق المتناثرة',
    '-	أسقي النباتات بانتظام',
    '-	أرمي النفايات في الحديقة',
    '-	أحافظ على نظافة الحديقة',
  ];

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
    final Map Exercice = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map;
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
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "كيف تعتني بحديقة منزلكم ؟",
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 8.0),
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
                                          builder: (context) => const Text1()));
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
                                            fontSize: 20,
                                            color: Colors.pinkAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: 8.0),
                              child: Text(
                                " : إضغط هنا لقراءت النَص",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                                margin: const EdgeInsetsDirectional.only(bottom: 10),
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 20, start: 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomRight: Radius.circular(
                                                      20))),
                                          primary: Color(colorbox[index])),
                                      onPressed: () {
                                        setState(() {
                                          i = index;
                                          change();
                                        });

                                        setState(() {
                                          changescore();
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        child: Text(
                                          answers[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pink),
                            onPressed: () {
                              if (score < 0) {
                                setState(() {
                                  score = 0;
                                });
                              }
                              setState(() {
                                daystate.i = 0;
                                daystate.refresh(score + 0.0);
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