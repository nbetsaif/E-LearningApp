import 'package:flutter/material.dart';
import 'package:ppp/modules/arabic/Day6.dart';
import 'package:ppp/modules/arabic/day6/Text.dart';

import '../../../../RoutesHERO/HeroRoute.dart';


class Exercice63 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice31State createState() => _Exercice31State();
}

class _Exercice31State extends State<Exercice63> {
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
      resizeToAvoidBottomInset: false,
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
                                      builder: (context) => const Text6()));
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    end: 8, start: 8, bottom: 20),
                                alignment: Alignment.center,
                                //margin: const EdgeInsetsDirectional.only(end: 30),
                                child: const Text(
                                  '   تلعب الشّجرة دورا هامّا في الحفاظ على البيئة. أتصوّر حوارا بين الأم والطفل حول فوائد الشّجرة دون أن أنسى النّصائح الَلازمة للعناية بالمحيط البيئيّ وعَلامات التنقيط ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.pink),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Theme.of(context).focusColor,
                                  enableInteractiveSelection: true,
                                  maxLength: 500,
                                  textAlign: TextAlign.center,
                                  controller: myController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                    hintText: ' الاجابة يجب أن تفوق 100 حرف',
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height/3.5,
                            width: 400,
                            child: Image.asset('assets/images/kid2.png'))
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
                          if (reponseQ1.length > 100) score = score + 4;
                          setState(() {
                            daystate6.i = 2;
                            daystate6.refresh(score + 0.0);
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
