import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/Block/cubit.dart';
import 'package:quran/Block/states.dart';
import 'package:quran/pages/navgationpar.dart';
import 'package:quran/pages/onboarding.dart';
import 'Dio-Helper/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHellper.init();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit()..getayaoftheday()..getallquran(),
        )
      ],
      child: BlocConsumer<QuranCubit, QuranStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:NaveparScreen(),
          );
        },
      ),
    );
  }
}
