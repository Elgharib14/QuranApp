import 'package:flutter/material.dart';
import 'package:quran/models/onmordingmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'navgationpar.dart';

class OnBordingScreen extends StatefulWidget {

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  List<onBordingModel> screens =[
     onBordingModel(
      "assets/quran.png",
      "Read Quean", 
      "Customize your reading view, read in multiple language, listen differnt audio."
      ),
     onBordingModel(
      "assets/prayer.png",
      "Prayer Alerts", 
      "Choose your adhan, which pryer to be notified of and how ofton."
      ),
     onBordingModel(
      "assets/zakat.png",
      "Build Better Habits", 
      "Make islamic practicos a part of your daily life in a way that bost suits your life"
      )
  ];
   var boardcontroller = PageController();
  bool isLast = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: (){
              setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => NaveparScreen(),));
              });
            },
            child: const Text('skip',
             style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 25
            ),
            )
            )
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
         
          children: [
            
           Expanded(
             child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardcontroller,
              onPageChanged: (int index) {
                if(index == screens.length - 1){
                  print('last');
                  setState((){
                   isLast = true; 
                  });
                
                }else{
                  print('No last');
                 setState((){
                    isLast = false;
                  });
                }
              },
              itemBuilder:(context, index) => buildOnBordingItme(screens[index]),
              itemCount: screens.length,
               ),
           ),
            Row(
              children: [
               SmoothPageIndicator(
                effect:ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  expansionFactor: 4,
                  activeDotColor: Colors.deepPurple,
                  spacing: 5,
                ) ,
                controller: boardcontroller,
                count: screens.length,
               ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.deepPurpleAccent,
                  onPressed: (){
                    if(isLast){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NaveparScreen(),));
                    }else{
                      boardcontroller.nextPage(
                      duration:Duration(milliseconds: 750) , 
                      curve: Curves.fastOutSlowIn
                    );
                    }
                   
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded,size: 35,),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
  }

Widget buildOnBordingItme(onBordingModel model){
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
              child: 
              Image(image:AssetImage("${model.imagename}"),
              fit: BoxFit.fill,
              )
              ),
              SizedBox(height: 30,),
            Text('${model.text1}',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
            SizedBox(height: 30,),
             Text('${model.text2}',style: TextStyle(
              fontSize: 25,
              color: Colors.grey
            ),),
    ],
  );
}



