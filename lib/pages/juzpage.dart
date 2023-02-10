import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';

import '../models/juzmodell.dart';

class JuzPage extends StatelessWidget {
  final Data data;

  const JuzPage({ required this.data});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body:ConditionalBuilder(
            condition: state is! getJuzLoding , 
            builder: (context) => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.ayahs!.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),
                      child: Text(
                                  '${data.ayahs![index].text}  (${data.ayahs![index].numberInSurah})',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize:25,
                                    fontWeight: FontWeight.w400
    
                                    ),
                                  ),
                    ),
                  );
                  
              },
              ), 
            fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
        );
      },
    );
  }
}