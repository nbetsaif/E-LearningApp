import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../arabic/arabic_screen.dart';
import '../math/math_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 50,
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: (){
            navigateTo(context,MathScreen() );
          },
          child: Column(
            children: [
              Container(
                  width: 150,
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25)),
                      image: DecorationImage(
                        opacity: 0.9,
                        scale: 0.5,
                        image: AssetImage('assets/images/math.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25)),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(5,5)
                  ),
                  ],
                  color: Color.fromRGBO(
                      220, 236, 240, 1),
                ),
                width: 150,
                child: const Center(
                    child: Text(
                  'الرياضيات',
                  style: TextStyle(fontSize: 20),
                )),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){navigateTo(context, ArabicScreen());},
          child: Column(
            children: [
              Container(
                  width: 150,
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/arabe.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25)),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(5,5)
                  ),
                  ],
                  color: Color.fromRGBO(
                      220, 236, 240, 1),
                ),
                width: 150,
                child: const Center(
                    child: Text(
                  'اللغة العربية',
                  style: TextStyle(fontSize: 20),
                )),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){},
          child: Column(
            children: [
              Container(
                  width: 150,
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(25)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/francais.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(5, 5)),
                  ],
                  color: Color.fromRGBO(220, 236, 240, 1),
                ),
                width: 150,
                child: const Center(
                    child: Text(
                  'الفرنسية',
                  style: TextStyle(fontSize: 20),
                )),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){},
          child: Column(
            children: [
              Container(
                  width: 150,
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25)),

                      image: DecorationImage(
                        image: AssetImage('assets/images/bouton4.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(5, 5)),
                  ],
                  color: Color.fromRGBO(220, 236, 240, 1),
                ),
                width: 150,
                child: const Center(
                    child: Text(
                  'الإيقاظ العلمي',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
