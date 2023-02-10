import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/states.dart';
import 'package:quran/Dio-Helper/dio.dart';
import 'package:quran/models/ayaofthedaymodel.dart';
import 'package:quran/models/juzmodell.dart';
import 'package:quran/models/surahmodell.dart';

import '../models/quranmodell.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitialState());

  static QuranCubit get(context) => BlocProvider.of(context);

  int curntindex =0;
  void changebuttomnav(index){
    curntindex = index;
    emit(ChangebottemnavState());
  }



  AyaofthedayModell? modell;
  void getayaoftheday(){
    DioHellper.getData(
      url: 'ayah/${random(1, 6237)}/ar.alafasy'
      ).then((value){
        modell = AyaofthedayModell.fromJson(value.data);
        // print(modell!.data!.text);
        emit(getAyaofdaysuccessState());
      }).catchError((Error){
        print(Error.toString());
        emit(getAyaofdayerrorState());
      });
  }
  random (min , max){
    var rn = new Random();
    return min + rn.nextInt(max-min);
  }

// SurahModell? surahModell;
// void getSurah(){
//   DioHellper.getData(
//     url: 'surah',
//     ).then((value){
//       surahModell = SurahModell.fromJson(value.data);
//       // print(surahModell!.data!.edition);
//       emit(getSurahsuccessState());
//     }).catchError((Error){
//       print('1 ${Error.toString()}');
//       emit(getSuraherrorState());
//     });
// }
QuranModell? quranModell;
void getallquran(){
  DioHellper.getData(
    url: 'quran/ar.alafasy'
    ).then((value){
      emit(getquranSucess());
      quranModell = QuranModell.fromJson(value.data);
      print(value.data);
    }).catchError((Error){
      emit(getquranError());
      print('2 ${Error.toString()}');
    });
}

JuzModell? juzModell;
void getjuz(String index){
  emit(getJuzLoding());
  DioHellper.getData(
    url: 'juz/${index}/quran-uthmani'
    ).then((value){
      juzModell = JuzModell.fromJson(value.data);
      print(value.data);
      emit(getJuzSucess());
    }).catchError((Error){
      print(Error.toString());
      emit(getJuzError());
    });
}
int counter =0;
int index =0;
void Counter(){
  counter++;
  if(index == 0 && counter == 33){
    index = 1;
    counter = 0;
  }else if(index ==1 && counter == 33){
    index =2;
    counter =0;
  }else if(index == 2 && counter == 33){
    index = 3;
    counter =0;
  }else if(index == 3 && counter==33){
    index=0;
    counter=0;
  }
  emit(counterSucess());
 
}



}