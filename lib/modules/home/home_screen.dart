import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ppp/modules/home/cubit/cubit.dart';
import 'package:ppp/modules/home/cubit/states.dart';
import 'package:ppp/shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  HomeCubit.get(context).changeBotNav(index);
                },
                currentIndex: HomeCubit.get(context).currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "الصفحة الرئيسية",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.school), label: "الرتبة",backgroundColor: Colors.red),
                ],
              ),
              body: SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.4,
                          image: AssetImage('assets/images/bg.jpg'))),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  LogOutButton(context)
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    'عصافير السنة الثانية',
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: HexColor('#00A4AC'),
                                        fontWeight: FontWeight.w500),
                                  )),
                              const Align(
                                alignment: Alignment.topCenter,
                                child: Image(
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 190,
                                  image: AssetImage('assets/images/logo.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(child: HomeCubit.get(context).screens[HomeCubit.get(context).currentIndex])
                      ],
                    ),
                  ),
                ),
              ));
        },
        listener: (context, state) {
          print(state);
        });
  }

}
