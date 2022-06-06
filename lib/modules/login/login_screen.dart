import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ppp/modules/register/register_screen.dart';
import 'package:toast/toast.dart';
import '../../shared/components/components.dart';
import '../../shared/components/conditional_widget.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../home/home_screen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          print(state);
          if (state is LoginSuccessState) {
            CacheHelper.putData(key: 'uid', data: state.uid).then((value) {
              uid = state.uid;
              navigateWithoutComeBack(context, const HomeScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.4,
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 145,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          const Text(
                            'دخول',
                            style: TextStyle(
                              color: Color.fromRGBO(65, 174, 217, 1),
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'الرجاء إدخال الإسم و كلمة العبور للدخول إلى فضاء عصافير السنة الثانية',
                            style: TextStyle(
                              color: Color.fromRGBO(109, 103, 163, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: AlignmentDirectional.centerEnd,
                            child: const Text(
                              'الإسم',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(109, 103, 163, 1),
                              ),
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال الإسم';
                              }
                              return (null);
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person,
                                  color: Color.fromRGBO(65, 174, 217, 1)),
                              hintStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.grey[500],
                              ),
                              hintText: ' إدخال الإسم',
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: const Text(
                              'كلمة العبور',
                              style: TextStyle(
                                  color: Color.fromRGBO(109, 103, 163, 1),
                                  fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("الرجاء إدخال كلمة السر");
                              }
                              return (null);
                            },
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    name: nameController.text + "@gmail.com",
                                    password: passwordController.text);
                              }
                            },
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 23, color: Colors.grey[500]),
                                hintText: "إدخال كلمة العبور",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(65, 174, 217, 1),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    LoginCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  icon: LoginCubit.get(context).isPassword
                                      ? const Icon(Icons.visibility_off,
                                          color:
                                              Color.fromRGBO(65, 174, 217, 1))
                                      : const Icon(Icons.remove_red_eye,
                                          color:
                                              Color.fromRGBO(65, 174, 217, 1)),
                                )),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: LoginCubit.get(context).isPassword,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "لست مسجل بعد؟ ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalWidget(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        name:
                                            nameController.text + "@gmail.com",
                                        password: passwordController.text);
                                  }
                                },
                                text: 'دخول',
                                isUpperCase: false),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                  onPressed: () async {
                                    bool hasInternet =
                                        await InternetConnectionChecker()
                                            .hasConnection;
                                    if (hasInternet) {
                                      navigateTo(context, RegisterScreen());
                                    } else {
                                      showToast(
                                          state: ToastStates.WARNING,
                                          message:
                                              'الرجاء تفعيل الإنترنات للتسجيل');
                                    }
                                  },
                                  child: const Text(
                                    'تسجيل',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueAccent,
                                    ),
                                  )),
                              const Text(
                                "لست مسجل بعد؟ ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Color.fromRGBO(109, 103, 163, 1),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
