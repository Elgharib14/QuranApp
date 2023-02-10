import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';

class AudioPage extends StatelessWidget {
  List<String> text = [
    'سبحان الله',
    'الحمد الله',
    'الله اكبر',
    'لا اله الا الله',
  ];
  int index = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:250),
              Text(
                text[QuranCubit.get(context).index],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                QuranCubit.get(context).counter.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                   height: 80,
                   width: 80,
                    child: FloatingActionButton(
                      backgroundColor: Colors.deepPurple,
                      onPressed: (){QuranCubit.get(context).Counter();},
                      child:Icon(Icons.add,size: 45,) ,
                      ),
                  )),
              ),
            ],
          ),
        );
      },
    );
  }
}
