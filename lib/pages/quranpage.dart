import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';
import 'package:quran/pages/juzpage.dart';
import 'package:quran/pages/surahdetails.dart';

import '../customs/customs.dart';

class QuranPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                automaticallyImplyLeading: false,
                elevation: 0.0,
                title: Text('Quran',style: TextStyle(
                  fontSize: 25
                ),),
                centerTitle: true,
                bottom: TabBar(
                  indicatorColor:Colors.white ,
                tabs: [
                  Tab(
                    child: Text('Surah',style: TextStyle(
                      fontSize: 25
                    ),),
                  ),Tab(
                    child: Text('Juz',style: TextStyle(
                      fontSize: 25
                    ),),
                  )
                ],
              ),
              ),
              body: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConditionalBuilder(
                     condition:QuranCubit.get(context).quranModell !=null , 
                     builder: (context) {
                       return ListView.separated(
                        physics: BouncingScrollPhysics(),
                         scrollDirection: Axis.vertical,
                         itemBuilder: (context, index) => Surahcustum(
                          fun: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) =>SurahDetails(
                              surahs:QuranCubit.get(context).quranModell!.data!.surahs![index] ,
                             )));
                          },
                           Surahnumber: QuranCubit.get(context).quranModell!.data!.surahs![index].number! ,
                           Surahname: QuranCubit.get(context).quranModell!.data!.surahs![index].englishName!, 
                           Suraharabname: QuranCubit.get(context).quranModell!.data!.surahs![index].name!, 
                           Surahtranname: QuranCubit.get(context).quranModell!.data!.surahs![index].englishNameTranslation!
                           ),
                           itemCount: QuranCubit.get(context).quranModell!.data!.surahs!.length, 
                           separatorBuilder: (BuildContext context, int index)=>Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(height: 1,color: Colors.grey,),
                           ),
                         );
                     }, 
                     fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,)),),
                  ),
                  
                     GestureDetector(
                       child: Container(
                        padding: EdgeInsets.all(8),
                         child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: 30,
                          itemBuilder:(context, index) =>InkWell(
                            onTap: (){
                              QuranCubit.get(context).getjuz('${index+1}');
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>JuzPage(
                                data: QuranCubit.get(context).juzModell!.data!,
                              ) ));
                            },
                            child: Card(
                                elevation: 4,
                                color: Colors.grey[200],
                                child: Center(child: Text('${index+1}',style: TextStyle(
                                  fontSize: 25
                                ),)),
                             
                              
                            ),
                          )
                                           ),
                       ),
                     ),
                   
                 
                    
                ],
              )
            ),
          ),
        );
      },
    );
  }
}