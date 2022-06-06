import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/modules/home/cubit/states.dart';
import 'package:ppp/modules/rank/rank_screen.dart';
import '../../../models/register/register_model.dart';
import '../../../shared/components/constants.dart';
import '../../home_body/home_body.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() :super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
     const HomeBody(),
     const RankScreen(),
  ];

  void changeBotNav(int index) {
    if(index==1) {
      users.clear();
      getAllUsers();
    }
    currentIndex = index;
    emit(HomeChangeBotNavBarState());
  }

  late RegisterModel model;
   double score=0;
  List<double> scoresMath= [0,0,0,0,0,0];
  List<double> scoresArabic= [0,0,0,0,0,0];

  void getUserData(){
    int i=0;
    while(users[i].uid!=uid){
      i++;
    }
    model=users[i];
  }

  void updateUser() {
    getUserData();
    emit(HomeUpdateUserLoadingState());
    score=0;
    for (int i=0;i<scoresMath.length;i++) {
      score+=(scoresMath[i]+scoresArabic[i])/2;
    }
    model.score=score/6;
    model.scoresArabic=scoresArabic;
    model.scoresMath=scoresMath;
    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uid)
        .update(model.toMap())
        .then((value) {
          print(model.toMap());
          emit(HomeUpdateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeUpdateUserErrorState(error));
    });
  }
  List<RegisterModel> users = [];
  void getAllUsers() {
    emit(HomeGetAllUsersLoadingState());
    // if (users.isEmpty) {
      FirebaseFirestore.instance.collection('users').orderBy('score',descending: true).get().then((value) {
        for (var element in value.docs) {
            users.add(RegisterModel.fromJson(element.data()));
        }
        emit(HomeGetAllUsersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(HomeGetAllUsersErrorState(error.toString()));
      });
    // }
  }
}