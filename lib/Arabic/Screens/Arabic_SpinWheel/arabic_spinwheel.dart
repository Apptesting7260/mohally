// ignore_for_file: unused_import
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
// ignore_for_file: unused_local_variable

class SpinTheWheelOneScreen_arabic extends StatefulWidget {
  const SpinTheWheelOneScreen_arabic({Key? key})
      : super(
          key: key,
        );
  @override
  State<SpinTheWheelOneScreen_arabic> createState() => _SpinTheWheelOneScreen_arabicState();
}

class _SpinTheWheelOneScreen_arabicState extends State<SpinTheWheelOneScreen_arabic> {
  StreamController<int> selected = StreamController<int>.broadcast();
  AudioPlayer audioPlayer = AudioPlayer();
  var bytes;
  bool _isSpinning = false;
   String Wheelurl = "assets/audio/ring.mp3";
@override
void initState() {
  super.initState();
audioChangeInByte();
}

  @override
void dispose() {
selected.close();
audioPlayer.dispose();
super.dispose();
  }
  Future<void> audioChangeInByte() async {
  
    ByteData data = await rootBundle.load(Wheelurl);
    bytes = BytesSource(data.buffer.asUint8List());
    audioPlayer.audioCache;
  }

  playAudio() async {
    var result = await audioPlayer.play(bytes);
    print('Audio Played ');
    
  }
  @override
  Widget build(BuildContext context) {
    
mediaQueryData = MediaQuery.of(context);
 final items = <String>[
'\$1.50',
 '\$2.0',
'2 scratch ',
'\$0.7',
'\$0.9',
 '2 scratch ',
'\$1.50',
 '\$1.50',
  ];
    List<Color> colorstwo = [
  Colors.red,
   const Color.fromARGB(255, 255, 153, 0),
   Colors.yellow,
   Colors.blue,
   Colors.pink,
   const Color.fromARGB(255, 5, 35, 87),
   Color.fromARGB(255, 19, 105, 94),
   Colors.grey,
  ];
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text('تدور العجلة', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Almarai', ),)),
          leading: Padding(
            padding: const EdgeInsets.only(top:15, ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width*.07,
                height: Get.height*.03,
                decoration: BoxDecoration(shape: BoxShape.circle, color: const Color.fromARGB(90, 158, 158, 158)),
                child: Icon(Icons.arrow_back, )),
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 46.h,
            top: 65.v,
            right: 46.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 316.v,
                width: 280.h,
                child: 
                Stack(
                  children: [
                    Container(
                      height: Get.height*.4,
                      width: Get.width*.8,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color.fromARGB(255, 185, 113, 35), width: Get.width*.008),
                     color: Color(0xffff8300),
                      ),
                    
                    ),
                    Center(
                      child: Container(
                        height: Get.height*.3,
                        width: Get.width*.8,
                      
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: Get.width*.007),
                     
                        ),
                        child: 
                       FortuneWheel(

                      onAnimationStart: () {
    setState(() {
      _isSpinning = true;
    playAudio();
      
    });
  },
onAnimationEnd: () {
  setState(() {
    _isSpinning = false;
audioPlayer.stop();
  
  });

  selected.stream.listen((int selectedIndex) {
    print('Selected index: $selectedIndex');
    print(items[selectedIndex]);

  });
},
             selected: selected.stream,
                       indicators: [FortuneIndicator(child: Center(child:
                       Stack(children: [
                        Positioned(
                         right: 106,
                         top: 80,
                          child: Transform.rotate( angle: 3.14159 / 2,
                          child: Image.asset('assets/images/spin.png'))),
                        Center(
                          child: Container(
                            width: Get.width*.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: Get.width*.007),
                              color: Color(0xffff8300)
                            ),
                          ),
                        )
                       ],),))],
  
  items: [
    for (int i = 0; i < 8; i++) ...<FortuneItem>[
                    FortuneItem(
                      style: FortuneItemStyle(
                        borderColor: colorstwo[i],
                        color: colorstwo[i], 
                        textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
                        fontSize: 14
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .10,
                          ),
Text(items[i], )
                      ]
                      ),
                    ),
                  ],
  ]
                  ),
                  
                    ),
                )]
                )
              ),
              SizedBox(height: 24.v),
              Text(
                "تدور العجلة",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.black
                ),
              ),
              SizedBox(height: 20.v),
              Text(
                "السحب اليومي للفوز أو بطاقة Scartch للفوز",
                style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Almarai', color: Colors.grey
                ),
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                 onPressed: () {
                   if (!_isSpinning) {
                    int randomIndex = Random().nextInt(8);
                    selected.add(randomIndex);
                    Future.delayed(Duration.zero, () {
                      selected.add(randomIndex); 
                    });
                  }
                },
                text: "يلعب",
                margin: EdgeInsets.only(
                  left: 26.h,
                  right: 27.h,
                ),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Almarai', color: Colors.white
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
  // Future<void> _playAudio(String audioPath) async {
  //   await audioPlayer.play(Uri.parse(audioPath).toString() as Source);
  // }

  // Future<void> _stopAudio() async {
  //   await audioPlayer.stop();
  // }

  /// Section Widget
}

