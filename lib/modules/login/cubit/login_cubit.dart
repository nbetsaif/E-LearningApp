import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ppp/modules/login/cubit/login_states.dart';
import 'package:ppp/shared/components/components.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool hasInternet=false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(LoginPasswordState());
  }

  void userLogin({required name, required password}) async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    print(hasInternet);
    if (hasInternet) {
      emit(LoginLoadingState());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: name, password: password)
          .then((value) {
        emit(LoginSuccessState(value.user!.uid));
        showToast(
          state: ToastStates.SUCCESS,
          message: 'تم الدخول بنجاح',
        );
      })
          .catchError((error) {
        print(error.toString());
        emit(LoginErrorState(error.toString()));
        showToast(
          state: ToastStates.ERROR,
          message: 'الرجاء إدخال البيانات الصحيحة',
        );
      });
    }
    else
      {
        showToast(state: ToastStates.WARNING, message:'الرجاء تفعيل الإنترنات للدخول');
      }
  }
}
