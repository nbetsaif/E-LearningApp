import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ppp/modules/home/home_screen.dart';
import 'package:ppp/modules/math/day1/Day1.dart';
import 'package:ppp/modules/math/day2/Day2.dart';
import 'package:ppp/modules/math/day3/Day3.dart';
import 'package:ppp/modules/math/day4/Day4.dart';
import 'package:ppp/modules/math/day6/Day6.dart';
import 'package:ppp/shared/components/components.dart';

import '../../RoutesHERO/HeroRoute.dart';
import 'day5/Day5.dart';

class MathScreen extends StatelessWidget {
   MathScreen({Key? key}) : super(key: key);
List<Color> colors=[Colors.green[300]!,Colors.red[300]!,Colors.green[400]!,Colors.red[400]!,Colors.green[500]!,Colors.red[600]!,];
List<String> days=['اليوم الأول','اليوم الثاني','اليوم الثالث','اليوم الرابع','اليوم الخامس','اليوم السّادس'];
List<Widget> dayScreen=[const Day1(txt: 'DAY1',),const Day2(txt: 'DAY2',),const Day3(txt: 'DAY3',),const Day4(txt: 'DAY4',),const Day5(txt: 'DAY5',),const Day6(txt: 'DAY6',)];
List<String> herolist = ['DAY1', 'DAY2','DAY3', 'DAY4','DAY5', 'DAY6'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
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
                    height: 170,
                    child: Stack(
                      children: [
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
                            height: 150,
                            width: 200,
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [
                         Colors.red.withOpacity(0.4),
                         Colors.green.withOpacity(0.4),
                       ]
                     )
                    ),
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            navigateWithoutComeBack(context, const HomeScreen());
                          },
                          child: Container(
                            width: 80,
                            height: 90,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/home.png')),
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'الرياضيات',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 113, 188,1 )),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              HeroDialogRoute(builder: (context) => dayScreen[index]));
                        },
                        child: Hero(
                          tag: herolist[index],
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: index.isEven? Colors.green[200]!:Colors.red[200]!,
                                offset: const Offset(2,8),
                                blurRadius: 1
                              )],
                                color: colors[index],
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                                ),
                            child: DefaultTextStyle(
                              child:Text(
                                days[index],),
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white),
                            )

                          ),
                        ),
                      ),
                    ),
                    itemCount: days.length,
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
