import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';
import 'dart:ui';
import '../models/quranmodell.dart';

class SurahDetails extends StatelessWidget {
  @override
  final Surahs surahs;

  const SurahDetails({ required this.surahs});
  
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 0.0,
          title: Text('${surahs.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          centerTitle: true,

          ),
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                  child: Text(
                              '${surahs.ayahs![index].text}  (${surahs.ayahs![index].numberInSurah})',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize:25,
                                fontWeight: FontWeight.w400

                                ),
                              ),
                ),
              ),
            separatorBuilder: (context, index) => SizedBox(height:0,), 
            itemCount: surahs.ayahs!.length
            ),
        );
      },
    );
  }
}
