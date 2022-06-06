import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/models/register/register_model.dart';
import 'package:ppp/modules/register/cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  bool hasInternet=false;
  void changeVisibility() {
    isPassword = !isPassword;
    emit(ChangeVisibilityState());
  }

  void register(
      {required name, required familyName, required age, required password}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: name+"@gmail.com", password: password)
        .then((value){
          print('here');
       userCreate(name: name, uid: value.user!.uid,age: age,familyName: familyName);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required age,
    required name,
    required familyName,
    required uid,
  }) {

    RegisterModel model = RegisterModel(nom: name, prenom: familyName, age: age, uid: uid,scoresMath: [0,0,0,0,0,0],scoresArabic: [0,0,0,0,0,0]);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value){
          print('again');
          emit(RegisterCreateUserSuccessState(uid));
    })
        .catchError((error) {
          print(error.toString());
          emit(RegisterCreateUserErrorState(error.toString()));
    });
  }
}
