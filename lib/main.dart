import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppp/modules/home/cubit/cubit.dart';
import 'package:ppp/modules/home/cubit/states.dart';
import 'package:ppp/modules/home/home_screen.dart';
import 'package:ppp/modules/login/login_screen.dart';
import 'package:ppp/modules/math/day6/Exercice1/Exercice61.dart';
import 'package:ppp/modules/math/day6/Exercice2/Exercice62.dart';
import 'package:ppp/modules/math/day6/Exercice3/Exercice63.dart';
import 'package:ppp/shared/components/constants.dart';
import 'package:ppp/shared/network/local/cache_helper.dart';
import 'package:toast/toast.dart';

import 'modules/arabic/day1/Exercice1/Exercice11.dart';
import 'modules/arabic/day1/Exercice2/Exercice12.dart';
import 'modules/arabic/day1/Exercice3/Exercice13.dart';
import 'modules/arabic/day2/Exercice1/Exercice21.dart';
import 'modules/arabic/day2/Exercice2/Exercice22.dart';
import 'modules/arabic/day2/Exercice3/Exercice23.dart';
import 'modules/arabic/day3/Exercice1/Exercice31.dart';
import 'modules/arabic/day3/Exercice2/Exercice32.dart';
import 'modules/arabic/day3/Exercice3/Exercice33.dart';
import 'modules/arabic/day4/Exercice1/Exercice41.dart';
import 'modules/arabic/day4/Exercice2/Exercice42.dart';
import 'modules/arabic/day4/Exercice3/Exercice43.dart';
import 'modules/arabic/day5/Exercice1/Exercice51.dart';
import 'modules/arabic/day5/Exercice2/Exercice52.dart';
import 'modules/arabic/day5/Exercice3/Exercice53.dart';
import 'modules/arabic/day6/Exercice1/Exercice61.dart';
import 'modules/arabic/day6/Exercice2/Exercice62.dart';
import 'modules/arabic/day6/Exercice3/Exercice63.dart';
import 'modules/math/day1/Exercice1/Exercice11.dart';
import 'modules/math/day1/Exercice2/Exercice12.dart';
import 'modules/math/day1/Exercice3/Exercice13.dart';
import 'modules/math/day2/Exercice1/Exercice21.dart';
import 'modules/math/day2/Exercice2/Exercice22.dart';
import 'modules/math/day2/Exercice3/Exercice23.dart';
import 'modules/math/day3/Exercice1/Exercice31.dart';
import 'modules/math/day3/Exercice2/Exercice32.dart';
import 'modules/math/day3/Exercice3/Exercice33.dart';
import 'modules/math/day4/Exercice1/Exercice41.dart';
import 'modules/math/day4/Exercice2/Exercice42.dart';
import 'modules/math/day4/Exercice3/Exercice43.dart';
import 'modules/math/day5/Exercice1/Exercice51.dart';
import 'modules/math/day5/Exercice2/Exercice52.dart';
import 'modules/math/day5/Exercice3/Exercice53.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  late Widget widget;
  uid=CacheHelper.getData(key: 'uid');
  if(uid!=null)
  {
    widget =const HomeScreen();
  }
  else
  {
    widget= LoginScreen();
  }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
   MyApp(this.widget,{Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return  BlocProvider(create: (context)=>HomeCubit()..getAllUsers(),
    child: BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){return MaterialApp(
        routes: {
          //********** ARABIC **********************
          '/Day1/ARABIC/exercice11': (context) => Exercice11(),
          '/Day1/ARABIC/exercice12': (context) => Exercice12(),
          '/Day1/ARABIC/exercice13': (context) => Exercice13(),

          '/Day2/ARABIC/exercice21': (context) => Exercice21(),
          '/Day2/ARABIC/exercice22': (context) => Exercice22(),
          '/Day2/ARABIC/exercice23': (context) => Exercice23(),

          '/Day3/ARABIC/exercice31': (context) => Exercice31(),
          '/Day3/ARABIC/exercice32': (context) => Exercice32(),
          '/Day3/ARABIC/exercice33': (context) => Exercice33(),

          '/Day4/ARABIC/exercice41': (context) => Exercice41(),
          '/Day4/ARABIC/exercice42': (context) => Exercice42(),
          '/Day4/ARABIC/exercice43': (context) => Exercice43(),

          '/Day5/ARABIC/exercice51': (context) => Exercice51(),
          '/Day5/ARABIC/exercice52': (context) => Exercice52(),
          '/Day5/ARABIC/exercice53': (context) => Exercice53(),

          '/Day6/ARABIC/exercice61': (context) => Exercice61(),
          '/Day6/ARABIC/exercice62': (context) => Exercice62(),
          '/Day6/ARABIC/exercice63': (context) => Exercice63(),


          //********** Maths **********************
          '/Day1/MATH/exercice11': (context) => Exercice111(),
          '/Day1/MATH/exercice12': (context) => Exercice112(),
          '/Day1/MATH/exercice13': (context) => Exercice113(),

          '/Day2/MATH/exercice21': (context) => Exercice221(),
          '/Day2/MATH/exercice22': (context) => Exercice222(),
          '/Day2/MATH/exercice23': (context) => Exercice223(),

          '/Day3/MATH/exercice31': (context) => Exercice331(),
          '/Day3/MATH/exercice32': (context) => Exercice332(),
          '/Day3/MATH/exercice33': (context) => Exercice333(),

          '/Day4/MATH/exercice41': (context) => Exercice441(),
          '/Day4/MATH/exercice42': (context) => Exercice442(),
          '/Day4/MATH/exercice43': (context) => Exercice443(),

          '/Day5/MATH/exercice51': (context) => Exercice551(),
          '/Day5/MATH/exercice52': (context) => Exercice552(),
          '/Day5/MATH/exercice53': (context) => Exercice553(),

          '/Day6/MATH/exercice61': (context) => Exercice661(),
          '/Day6/MATH/exercice62': (context) => Exercice662(),
          '/Day6/MATH/exercice63': (context) => Exercice663(),

        },
        debugShowCheckedModeBanner: false,
        title: 'ppp',
        home:widget,
      );},
    ),
    );
  }
}