import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/surahdetails.dart';

Widget Surahcustum({
 required int Surahnumber,
 required String Surahname,
 required String Suraharabname,
 required String Surahtranname,
 required Function fun
 
}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: (){
       fun();
      },
      child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 35,
                              child: Text(Surahnumber.toString(),style: TextStyle(fontSize: 25,color: Colors.white),),
                            ),
                            SizedBox(width: 10,),
                            Column(
                               crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(Surahname,style: TextStyle(fontSize: 23),),
                                SizedBox(height: 10,),
                                Text(Surahtranname,style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            Spacer(),
                            Text(Suraharabname,style: TextStyle(fontSize: 23),),
                          ],
                        ),
    ),
  );
}