import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/modules/home/cubit/cubit.dart';
import 'package:ppp/modules/home/cubit/states.dart';
import 'package:ppp/shared/components/conditional_widget.dart';
import 'package:ppp/shared/components/constants.dart';

import '../../models/register/register_model.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(builder: (context, state) {
      return ConditionalWidget(
        condition: HomeCubit.get(context).users.isNotEmpty ,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                rankItem(index, HomeCubit.get(context).users[index], context),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
            itemCount: HomeCubit.get(context).users.length),
        fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }, listener: (context, state) {
      if (state is HomeGetAllUsersErrorState) print(state.error);
    });
  }
}

Widget rankItem(int index, RegisterModel model, context) {
  Color color = Colors.white;
  switch (index) {
    case 0:
      color = const Color.fromRGBO(255, 215, 0, 1);
      break;
    case 1:
      color = const Color.fromRGBO(192, 192, 192, 1);
      break;
    case 2:
      color = const Color.fromRGBO(196, 156, 72, 1);
  }
  String mention="";
 if(model.score<10)
   mention='ضعيف';
 else if(10<model.score&&model.score<12)
   mention='متوسط';
 else if(12<model.score&&model.score<16)
   mention='حسن';
 else if(16<model.score)
   mention='حسن جدا';

  Color mycolor = Colors.blue.withOpacity(0.8);
  if (model.uid == uid) mycolor = Colors.pink;
  return Container(
    margin: const EdgeInsets.only(left: 12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
        color: mycolor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(27.5), bottomLeft: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 5,
              offset: const Offset(
                5,
                5,
              ))
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 5,),
        Text(
          "الملاحظة : ${mention}",
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 1.5,
          color: Colors.white.withOpacity(0.6),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "المعدل : ${model.score.toStringAsFixed(2 )}",
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 1.5,
          color: Colors.white.withOpacity(0.6),
        ),
        Expanded(
            child: Text(
          model.nom + ' ' + model.prenom,
          maxLines: 1,
          style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              overflow: TextOverflow.ellipsis),
        )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 1.5,
          color: Colors.white.withOpacity(0.6),
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor: color,
          child: Text(
            "${index + 1}",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}
