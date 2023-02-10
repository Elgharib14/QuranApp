import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';
import 'package:quran/pages/audiopage.dart';
import 'package:quran/pages/homepage.dart';
import 'package:quran/pages/mosquepage.dart';
import 'package:quran/pages/quranpage.dart';

class NaveparScreen extends StatelessWidget {

  List<Widget> screens=[
    HomePage(),
    QuranPage(),
    AudioPage(),
    MosquePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(

          body: screens[QuranCubit.get(context).curntindex],


          bottomNavigationBar: ConvexAppBar(
            elevation: 0.0,
            backgroundColor: Colors.deepPurple,
            initialActiveIndex:QuranCubit.get(context).curntindex ,
            onTap: (index){
              QuranCubit.get(context).changebuttomnav(index);
            },
            items: [
              TabItem(
                // backgroundColor:Colors.deepPurpleAccent ,
                icon: Image(image:AssetImage("assets/home.png"),height: 40 ,),
                title: 'Home'
              ),
               TabItem(
                icon: Image(image:AssetImage("assets/holyQuran.png"),height: 40),
                title: 'Quran'
              ),
               TabItem(
                icon: Image(image:AssetImage("assets/tasbih.png"),height: 40),
                title: 'Tasbih'
              ),
               TabItem(
                icon: Image(image:AssetImage("assets/mosque.png"),height: 40),
                title: 'Mosque'
              ),
            ],
          ),
        );
      },
    );
  }
}