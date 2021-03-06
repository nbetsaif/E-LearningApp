import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/modules/arabic/ExerccicePanel/ExercicePanel.dart';

import '../home/cubit/cubit.dart';
import '../home/cubit/states.dart';

_Day6State daystate6 = _Day6State();

class Day6 extends StatefulWidget {
  final String txt;

  const Day6({Key? key, required this.txt}) : super(key: key);

  @override
  _Day6State createState() {
    daystate6 = _Day6State();
    return daystate6;
  }
}

class _Day6State extends State<Day6> {
  int i = 0;
  bool value = false;
  List<double> note = [
    0,
    0,
    0,
  ];

  void refresh(double score) {
    setState(() {
      note[i] = score * 5;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Hero(
          tag: widget.txt,
          child: SafeArea(
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsetsDirectional.only(
                top: 48,
                bottom: 48,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ExercicePanel(
                        number1: 6,
                        number: 1,
                        note: note[0],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ExercicePanel(
                        number1: 6,
                        number: 2,
                        note: note[1],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ExercicePanel(
                        number1: 6,
                        number: 3,
                        note: note[2],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                            onTap: () {
                              double score = 0;
                              for (var element in note) {
                                score += element;
                              }
                              HomeCubit.get(context).scoresArabic[5] = score / 3;
                              HomeCubit.get(context).updateUser();
                            },
                            child: state is HomeUpdateUserLoadingState
                                ? const CircularProgressIndicator(
                              color: Colors.pink,
                            )
                                : Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 2,
                                        color: Colors.grey)
                                  ]),
                              width: 120,
                              alignment: Alignment.center,
                              child: const Text(
                                "?????????? ????????",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is HomeUpdateUserSuccessState) Navigator.pop(context);
      },
    );
  }
}
