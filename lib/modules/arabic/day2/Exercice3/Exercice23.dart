import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/day2/Text.dart';
import '../../../../RoutesHERO/HeroRoute.dart';
import '../../Day2.dart';
class Exercice23 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice23> {
  bool visible = false;
  double bottom = 0;
  double top = 0;
  @override
  void call() {
    top = 30;
    bottom = 600;
  }

  int score = 0;

  @override
  void initState() {
    clearText();
    super.initState();
  }

  final myController = TextEditingController();
  String reponseQ1 = '';
  void clearText() {
    myController.clear();
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
                                      builder: (context) => const Text2()));
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
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio:1/1.207,
                      crossAxisCount: 1,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:8,left: 8,top: 20,bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      ' المُسافِرينَ',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      ' بِ',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      'دخلَ',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      'دَخلَ',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      'مُكتظّا',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      'بهوًا',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: const Center(
                                        child: Text(
                                      'الولدُ',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(end: 30),
                              child: const Text(
                                ' إستعمل الّافتات لتعبّر عن فِكرةٍ وردت في النّص',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: myController,
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
                            SizedBox(
                              height: 300,
                              width: 200,
                              child: Image.asset('assets/images/kid1.png'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.pink),
                        onPressed: () {
                          if (reponseQ1 != '') {
                            setState(() {
                              score++;
                            });
                          }
                          setState(() {
                            daystate2.i = 2;
                            daystate2.refresh(score + 0.0);
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
