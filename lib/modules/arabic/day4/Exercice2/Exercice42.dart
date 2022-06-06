import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ppp/RoutesHERO/HeroRoute.dart';
import 'package:ppp/modules/arabic/day4/Text.dart';


import '../../Day4.dart';

class Exercice42 extends StatefulWidget {
  // final int number;
  // const Exercice1({Key? key, required this.number}) : super(key: key);

  @override
  _Exercice31State createState() => _Exercice31State();
}

class _Exercice31State extends State<Exercice42> {
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

  Function eq = const ListEquality().equals;
  void CalculScoreQ2() {
    if (eq(Q2Val, Q2sol)) {
      setState(() {
        score+=1;
      });
    }
  }

  void CalculScoreQ4() {
    if (eq(Q4Val, Q4ValSOL)) {
      setState(() {
        score+=2;
      });
    }
  }

  List<String> Q2 = [
    'حديقة المنزل ',
    'الحديقة العموميةَ',
    'حديقة المدرسةِ',
    'الحقل',
  ];
  List<bool> Q2Val = [false, false, false, false];
  List<bool> Q2sol = [false, true, false, false];

  List<String> Q4 = [
    'غضبت رحمة من الحارس ولم تعترف بخطئهاِ',
    'اقترح العم منير على رحمة أن تغرس شجرة ِ',
    'اعتذرت الأم من العم منيرُ',
    'لا يحب العم منير عمله',
  ];
  List<bool> Q4Val = [false, false, false, false];
  List<bool> Q4ValSOL = [false, true, true, false];

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
                    padding: const EdgeInsetsDirectional.only(bottom: 10),
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
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      childAspectRatio: 1.5,
                      crossAxisCount: 1,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20),
                              child: const Text(
                                'ما هو الإطار المكاني ؟',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
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
                              margin: const EdgeInsetsDirectional.only(end: 30),
                              child: const Text(
                                ' ماهي شخصيات النص؟',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: myController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[500],
                                  ),
                                  hintText: '/4شخصية1/شخصية2/شخصية3/شخصية',
                                ),
                                onChanged: (String rep) {
                                  setState(() {
                                    reponseQ1 = rep;
                                  });
                                },
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 145,
                                child: Image.asset('assets/images/kid1.png'),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                  end: 20),
                              child: const Text(
                                ' أختار اإلجابات الصحيحة',
                                style: TextStyle(fontSize: 20,color: Colors.pink),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: ListTile(
                                      title: Text(
                                        Q4[index],
                                        textAlign: TextAlign.end,
                                      ),
                                      trailing: Checkbox(
                                          value: Q4Val[index],
                                          onChanged: (val) {
                                            setState(() {
                                              Q4Val[index] = val!;
                                            });
                                          }),
                                    ),
                                  );
                                },
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: Q4.length,
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
                          if (reponseQ1 == 'العم منير/رحمة/سميرة/األطفال') {
                            score++;
                          }
                          CalculScoreQ2();
                          CalculScoreQ4();
                          setState(() {
                            daystate4.i = 1;
                            daystate4.refresh(score + 0.0);
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
