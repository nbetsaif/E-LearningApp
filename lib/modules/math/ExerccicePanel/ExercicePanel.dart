import 'package:flutter/material.dart';

_ExercicePanelState exercicepanel = _ExercicePanelState();

class ExercicePanel extends StatefulWidget {
  final int number1;
  final double note;
  final int number;

  const ExercicePanel(
      {Key? key,
      required this.number1,
      required this.number,
      required this.note})
      : super(key: key);

  @override
  _ExercicePanelState createState() {
    exercicepanel = _ExercicePanelState();
    return exercicepanel;
  }
}

class _ExercicePanelState extends State<ExercicePanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //margin: EdgeInsetsDirectional.only(start: 74.5),
          width: 80,
          height: 56,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(offset: Offset(5, 5), blurRadius: 2, color: Colors.grey)
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), bottomRight: Radius.circular(0)),
            color: Colors.red,
          ),
          child: Center(
              child: Text(
            "${widget.note} /20",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context,
                "/Day${widget.number1}/MATH/exercice${widget.number1}${widget.number}",
                // lahne bch nzid l langue zeda men an other widget ${widget.matiere}/
                arguments: {'number': widget.number});
          },
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(-5, 5), blurRadius: 2, color: Colors.grey)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomRight: Radius.circular(0)),
              color: Colors.green,
            ),
            width: 230,
            height: 56,
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 10),
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      " حظ موفق ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                  ),
                  Text(
                    "   :   ${widget.number}  السؤال",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}