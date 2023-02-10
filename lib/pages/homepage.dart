import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/Block/cubit.dart';

class HomePage extends StatelessWidget {
   
 
 
  @override
  Widget build(BuildContext context) {
    var hijer = HijriCalendar.now();
    HijriCalendar.setLocal("ar");
    var size = MediaQuery.of(context).size;
    var date = DateTime.now();
    var formatdate = DateFormat('EEEEEE , d MMM yyyy');
    var formated = formatdate.format(date);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children:[
                Image(image: AssetImage("assets/background_img.jpg")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                               text: hijer.hDay.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                          )
                            ),
                            TextSpan(
                               text:"   ${ hijer.longMonthName}",
                                style: TextStyle(
                                  fontSize: 20,
                          )
                            ),
      
                            TextSpan(
                               text: "   ${hijer.hYear.toString()}  AH",
                                style: TextStyle(
                                  fontSize: 20,
                          )
                            ),
                          ],
                         
                        ),
                      ),
                       Text(formated,style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         
                       ),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
               
              ]
            ),
            SizedBox(height: 60,),
            ConditionalBuilder(
              condition: QuranCubit.get(context).modell != null ,
              builder: (context) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${QuranCubit.get(context).modell!.data!.surah!.name}',
                        style: TextStyle(fontSize:25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      SizedBox(height: 20,),
                      Text(
                        '${QuranCubit.get(context).modell!.data!.text}',
                        style: TextStyle(fontSize:20),
                        ),
                      SizedBox(height: 20,),
                      Text(
                        'Aya number ${QuranCubit.get(context).modell!.data!.numberInSurah}',
                        style: TextStyle(fontSize:15),
                        ),
                    ],
                ),
              ),
            ),
                  ),
             
              fallback: (context) => CircularProgressIndicator(color: Colors.deepPurpleAccent,),)
           
      
          ],
        ),
      ),
    );
  }
}