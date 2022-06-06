import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/modules/login/login_screen.dart';
import 'package:ppp/modules/register/cubit/register_states.dart';

import '../../shared/components/components.dart';
import 'cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController=TextEditingController();
  var familyNameController=TextEditingController();
  var passwordController=TextEditingController();
  var ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterCreateUserSuccessState)
            {
             showToast(state: ToastStates.SUCCESS, message: 'تم التسجيل بنجاح');
             navigateWithoutComeBack(context, LoginScreen());
            }
          else if(state is RegisterCreateUserErrorState)
            {
              showToast(state: ToastStates.SUCCESS, message: 'الرجاء مراجعت البيانات');
            }
        },
        builder: (context, state) {
          return Scaffold(
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
                            height: 140,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          const Text(
                            'تسجيل',
                            style: TextStyle(
                              color: Color.fromRGBO(65, 174, 217, 1),
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'الرجاء إدخال البيانات الأتية للتسجيل',
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
                          TextFormField(
                            controller: nameController,
                            textAlign: TextAlign.center,
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
                              hintText: ' أدخل الإسم',
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: familyNameController,
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال اللقب';
                              }
                              return (null);
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.family_restroom,
                                  color: Color.fromRGBO(65, 174, 217, 1)),
                              hintStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.grey[500],
                              ),
                              hintText: ' أدخل اللقب',
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: ageController,
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال العمر';
                              }
                              return (null);
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range_sharp,
                                  color: Color.fromRGBO(65, 174, 217, 1)),
                              hintStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.grey[500],
                              ),
                              hintText: ' أدخل العمر',
                            ),
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("الرجاء إدخال كلمة السر");
                              }
                              return (null);
                            },
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 23, color: Colors.grey[500]),
                                hintText: "أدخل كلمة السر",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(65, 174, 217, 1),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changeVisibility();
                                  },
                                  icon: RegisterCubit.get(context).isPassword
                                      ? const Icon(Icons.visibility_off,
                                          color:
                                              Color.fromRGBO(65, 174, 217, 1))
                                      : const Icon(Icons.remove_red_eye,
                                          color:
                                              Color.fromRGBO(65, 174, 217, 1)),
                                )),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: RegisterCubit.get(context).isPassword,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultButton(
                              function: () {
                                if(formKey.currentState!.validate())
                                  {
                                    RegisterCubit.get(context).register(
                                      familyName: familyNameController.text,
                                      name: nameController.text,
                                      age: ageController.text,
                                      password: passwordController.text,);
                                  }
                              },
                              text: 'تسجيل'),
                          const SizedBox(
                            height: 10,
                          ),
                          if (state is RegisterLoadingState)
                            const LinearProgressIndicator(),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              TextButton(
                                  onPressed: () {
                                    navigateWithoutComeBack(
                                        context, LoginScreen());
                                  },
                                  child: const Text(
                                    'دخول',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueAccent,
                                    ),
                                  )),
                              const Text(
                                "مسجل من قبل؟",
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
