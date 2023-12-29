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


class SpinTheWheelOneScreen extends StatefulWidget {
  const SpinTheWheelOneScreen({Key? key})
      : super(
          key: key,
        );
  @override
  State<SpinTheWheelOneScreen> createState() => _SpinTheWheelOneScreenState();
}

class _SpinTheWheelOneScreenState extends State<SpinTheWheelOneScreen> {
  StreamController<int> selected = StreamController<int>.broadcast();
    AudioPlayer audioPlayer = AudioPlayer();
    
  // var bytes;
  bool _isSpinning = false;
 @override
  void initState() {
    super.initState();
    //  audioChangeInByte();
    // audioPlayer =AudioPlayer() ;
    
  }
  @override
  void dispose() {
    selected.close();
    // audioPlayer.dispose();
    super.dispose();
  }

//   Future<void> audioChangeInByte() async {
//   String url = "assets/images/wheel.mp3";
//   ByteData data = await rootBundle.load(url);
//   bytes = BytesSource(data.buffer.asUint8List());
//   await audioPlayer.setUrl(''); // Set the audio URL
// }
// playAudio() async {
//     var result = await audioPlayer.play();
//     if (result == 1) {
//       print('Audio played successfully');
//     } else {
//       print('Error playing audio');
//     }
//   }

//   stopAudio() async {
//     await audioPlayer.stop();
//   }

  
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
        appBar: _buildAppBar(context),
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
      //  playAudio();

    });
  },
onAnimationEnd: () {
  setState(() {
    _isSpinning = false;
    // stopAudio();

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
                         right: 125,
                         top: 95,
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
                        fontSize: 18
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
                "Spin The Wheel",
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 20.v),
              Text(
                "Daily Raffle To Win Or Scratch To Win Card",
                style: CustomTextStyles.bodyLargeGray50001_3,
              ),
              SizedBox(height: 26.v),
              CustomElevatedButton(
                 onPressed: () {
                   if (!_isSpinning) {
                    // Generate a random index for the wheel
                    int randomIndex = Random().nextInt(8);

                    // Add the random index to the stream to trigger the animation
                    selected.add(randomIndex);
                    Future.delayed(Duration.zero, () {
                      selected.add(randomIndex); // Trigger the animation
                    });
                  }
                },
                text: "Play",
                margin: EdgeInsets.only(
                  left: 26.h,
                  right: 27.h,
                ),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: (){
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Spin the Wheel",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
  
}




























// import 'dart:async';
// import 'dart:math';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../GlobalVariable/GlobalVariable.dart';
// import '../../controllers/SpinWheelController/SpeenWhhelController.dart';
// import '../../controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
// import '../../controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';
// import '../../controllers/controller/spinRequestController/SpinRequestController.dart';
// import '../../data/response/status.dart';
// import '../../match_seeker/Requests/outgoingRequest.dart';
// import '../../match_seeker/SeeAllMaker/SeAllMaker.dart';
// import '../../match_seeker/lever/StaticLiverPool.dart';
// import '../../res/components/general_exception.dart';
// import '../../res/components/internet_exceptions_widget.dart';
// import '../Spin_Will_Wigdet.dart';

// enum SwipeDirection { left, right, top }

// class UserProfile {
//   final String name;
//   final int age;
//   final String date;

//   UserProfile({
//     required this.name,
//     required this.age,
//     required this.date,
//   });
// }

// class SpinWheel extends StatefulWidget {
//   const SpinWheel({Key? key}) : super(key: key);

//   @override
//   State<SpinWheel> createState() => _SpinWheelState();
// }
// List spinedprofilelist=[];
// class _SpinWheelState extends State<SpinWheel>
//     with SingleTickerProviderStateMixin {
//   late int randomIndex = 0;
//   late bool spinning = false;

//   late AnimationController rotationController;
//   var totalData=0;

//   AudioPlayer audioPlayer = AudioPlayer();
//   var bytes;
  // List<Color> colorstwo = [
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  //   Color(0xff000CAA),
  //   Color(0xffFE0091),
  // ];
//   List<Map<String, String>> listOfZodic = [
//     {"image": "assets/DropDownZodicSing/Mask group (10).png", "name": "Pisces"},
//     {"image": "assets/DropDownZodicSing/Mask group (9).png", "name": "Aries"},
//     {"image": "assets/DropDownZodicSing/Mask group (8).png", "name": "Taurus"},
//     {"image": "assets/DropDownZodicSing/Mask group (6).png", "name": "Gemini"},
//     {"image": "assets/DropDownZodicSing/Mask group (4).png", "name": "Cancer"},
//     {"image": "assets/DropDownZodicSing/Mask group (3).png", "name": "Leo"},
//     {"image": "assets/DropDownZodicSing/Mask group.png", "name": "Virgo"},
//     {"image": "assets/DropDownZodicSing/Mask group (1).png", "name": "Libra"},
//     {"image": "assets/DropDownZodicSing/Mask group (2).png", "name": "Scorpio"},
//     {
//       "image": "assets/DropDownZodicSing/Mask group (5).png",
//       "name": "Sagittarius"
//     },
//     {
//       "image": "assets/DropDownZodicSing/Mask group (7).png",
//       "name": "Capricorn"
//     },
//     {"image": "assets/DropDownZodicSing/Group 293.png", "name": "Aquarius"},
//   ];
//   List<String> image = [
//     "assets/horsecope/image (10).png",
//     "assets/horsecope/image (9).png",
//     "assets/horsecope/image (8).png",
//     "assets/horsecope/image (7).png",
//     "assets/horsecope/image (6).png",
//     "assets/horsecope/image (5).png",
//     "assets/horsecope/image (4).png",
//     "assets/horsecope/image (3).png",
//     "assets/horsecope/image (2).png",
//     "assets/horsecope/Mask group (9) (1).png",
//     "assets/horsecope/image (1).png",
//     "assets/horsecope/image.png"
//   ];
//   List<String> listOfHoroScope = [
//     "Pisces",
//     "Aries",
//     "Taurus",
//     "Gemini",
//     "Cancer",
//     "Leo",
//     "Virgo",
//     "Libra",
//     "Scorpio",
//     "Sagittarius",
//     "Capricorn",
//     "Aquarius",
//   ];
//   final List<UserProfile> userProfiles = [
//     UserProfile(name: 'John Doe', age: 25, date: '2022-12-01'),
//     UserProfile(name: 'Jane Smith', age: 28, date: '2022-11-25'),
//     UserProfile(name: 'Alice Johnson', age: 22, date: '2022-10-30'),
//     UserProfile(name: 'Bob Williams', age: 30, date: '2022-09-15'),
//     UserProfile(name: 'Eva Davis', age: 26, date: '2022-08-20'),
//   ];
//   var dataIndex;
//   SpeenWheelDataController speenWheelDataController =
//       Get.put(SpeenWheelDataController());
//   final SpeendReqestControllerinstance = Get.put(SpeendReqestController());
//   // final SpinwillTimerControllerinstance = Get.put(SpinwillTimerController());
//   final spinRequestController=Get.put(SpinRequestController());
//   final SeekerToSeekerRequestControllerinstance =
//   Get.put(SeekerToSeekerRequestController());

//   @override
//   void initState() {
//     super.initState();
//     audioChangeInByte();
//     rotationController = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: 1,
//       ),
//     );
//   }

//   bool isButton = false;

//   Future<void> audioChangeInByte() async {
//     String url = "assets/audio/bike-back-wheel-coasting-74816.mp3";
//     ByteData data = await rootBundle.load(url);
//     bytes = BytesSource(data.buffer.asUint8List());
//     audioPlayer.audioCache;
//   }

//   playAudio() async {
//     var result = await audioPlayer.play(bytes);
//     // if (result == 1) {
//     //   print('Audio played successfully=======================================================================');
//     // } else {
//     //   print('Error playing audio===============================================================================');
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {

//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: Get.height  * .05,
//               ),
//               Image.asset(
//                   'assets/images/match.png'),
//               SizedBox(
//                 height: Get.height  * .03,
//               ),

//               if (isButton)

//     Obx(() {
//     switch (speenWheelDataController.rxRequestStatus.value) {
//     case Status.LOADING:
//     return const Center(child: CircularProgressIndicator(  color: Colors.pink,));
//     case Status.ERROR:
//     if (speenWheelDataController.error.value == 'No internet') {
//     return InterNetExceptionWidget(
//     onPress: () {},
//     );
//     } else {
//     return GeneralExceptionWidget(onPress: () {});
//     }
//     case Status.COMPLETED:
//              return   Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [

//                     SizedBox(
//                       height: Get.height * .03,
//                     ),
//                     Text(
//                       '${totalData + 1}/12',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,

//                       ),
//                     ),

//                     SizedBox(
//                       height: Get.height * .03,
//                     ),
//                     Container(
//                       height: Get.height * 0.6,
//                       width: Get.width * 0.9,
//                       child: speenWheelDataController.SpeenWheelData.value.seekerData !=
//                               [] || speenWheelDataController.SpeenWheelData.value.seekerData!.length != 0
//                           ? CardSwiper(
//                               cardsCount: speenWheelDataController
//                                   .SpeenWheelData.value.seekerData!.length,
//                               numberOfCardsDisplayed: 2,
//                               backCardOffset: const Offset(0, -50),
//                               padding: const EdgeInsets.all(24.0),
//                               allowedSwipeDirection: AllowedSwipeDirection.only(
//                                 left: true,
//                                 right: true,
//                               ),
//                               onSwipe: _onSwipe,
//                               cardBuilder: (context,
//                                   index,
//                                   horizontalThresholdPercentage,
//                                   verticalThresholdPercentage) {
//                                 print(
//                                     "horigental${horizontalThresholdPercentage}");
//                                 print("vertical${verticalThresholdPercentage}");

//                                 final userProfile = userProfiles[index];
//                                 var data = listOfZodic[speenWheelDataController
//                                     .SpeenWheelData
//                                     .value
//                                     .seekerData![index]
//                                     .zodiacId-1];
//                                 print(speenWheelDataController
//                                     .SpeenWheelData
//                                     .value
//                                     .seekerData![index]
//                                     .zodiacId);
//                                 return Card(
//                                   elevation: 5,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Image goes here

//                                       horizontalThresholdPercentage == 0
//                                           ? Container(
//                                               height: Get.height * 0.4,
//                                               // Adjust the height as needed
//                                               // child: Align(
//                                               //   alignment: Alignment.topLeft,
//                                               //   child: Padding(
//                                               //     padding:
//                                               //         const EdgeInsets.only(
//                                               //             top: 20, left: 20),
//                                               //     child: Container(
//                                               //       width: 61,
//                                               //       height: 34,
//                                               //       child: Row(children: [
//                                               //         SizedBox(
//                                               //           width: Get.width * .03,
//                                               //         ),
//                                               //         Image.asset(
//                                               //           "assets/icons/LOCATION.png",
//                                               //           height: 15,
//                                               //         ),
//                                               //         SizedBox(
//                                               //           width: Get.width * .01,
//                                               //         ),
//                                               //         Text(
//                                               //           '1 km',
//                                               //           style: TextStyle(
//                                               //             color: Colors.white,
//                                               //             fontSize: 12,
//                                               //             fontFamily: 'Inter',
//                                               //             fontWeight:
//                                               //                 FontWeight.w500,
//                                               //             height: 0.12,
//                                               //           ),
//                                               //         )
//                                               //       ]),
//                                               //       decoration: ShapeDecoration(
//                                               //         color: Color(0x33F4F4F4),
//                                               //         shape:
//                                               //             RoundedRectangleBorder(
//                                               //                 borderRadius:
//                                               //                     BorderRadius
//                                               //                         .circular(
//                                               //                             7)),
//                                               //       ),
//                                               //     ),
//                                               //   ),
//                                               // ),

//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15.0),
//                                                 image: DecorationImage(
//                                                   image: NetworkImage(
//                                                       speenWheelDataController
//                                                           .SpeenWheelData
//                                                           .value
//                                                           .seekerData![index]
//                                                           .imgPath),
//                                                   // Replace with your image path
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             )
//                                           : Container(
//                                               height: Get.height * 0.4,
//                                               child:    horizontalThresholdPercentage >
//                                                   0
//                                                   ? Center(
//                                                 child: Align(
//                                                   child: Image.asset(
//                                                       "assets/image/like.png"),
//                                                   alignment:
//                                                   FractionalOffset
//                                                       .center,
//                                                 ),
//                                               )
//                                                   : Center(
//                                                 child: Align(
//                                                   child: Image.asset(
//                                                       "assets/image/cancel.png"),
//                                                   alignment:
//                                                   FractionalOffset
//                                                       .center,
//                                                 ),
//                                               ),

//                                               // Row(
//                                               //   crossAxisAlignment: CrossAxisAlignment.center,
//                                               //
//                                               //   children: [
//                                               //     Align(
//                                               //       alignment:
//                                               //           Alignment.topLeft,
//                                               //       child: Padding(
//                                               //         padding:
//                                               //             const EdgeInsets.only(
//                                               //                 top: 20,
//                                               //                 left: 20),
//                                               //         child: Container(
//                                               //           width: 61,
//                                               //           height: 34,
//                                               //           child: Row(children: [
//                                               //             SizedBox(
//                                               //               width:
//                                               //                   Get.width * .03,
//                                               //             ),
//                                               //             Image.asset(
//                                               //               "assets/icons/LOCATION.png",
//                                               //               height: 15,
//                                               //             ),
//                                               //             SizedBox(
//                                               //               width:
//                                               //                   Get.width * .01,
//                                               //             ),
//                                               //             Text(
//                                               //               '1 km',
//                                               //               style: TextStyle(
//                                               //                 color:
//                                               //                     Colors.white,
//                                               //                 fontSize: 12,
//                                               //                 fontFamily:
//                                               //                     'Inter',
//                                               //                 fontWeight:
//                                               //                     FontWeight
//                                               //                         .w500,
//                                               //                 height: 0.12,
//                                               //               ),
//                                               //             )
//                                               //           ]),
//                                               //           decoration:
//                                               //               ShapeDecoration(
//                                               //             color:
//                                               //                 Color(0x33F4F4F4),
//                                               //             shape: RoundedRectangleBorder(
//                                               //                 borderRadius:
//                                               //                     BorderRadius
//                                               //                         .circular(
//                                               //                             7)),
//                                               //           ),
//                                               //         ),
//                                               //       ),
//                                               //     ),
//                                               //     horizontalThresholdPercentage >
//                                               //             0
//                                               //         ? Center(
//                                               //           child: Align(
//                                               //               child: Image.asset(
//                                               //                   "assets/image/like.png"),
//                                               //               alignment:
//                                               //                   FractionalOffset
//                                               //                       .center,
//                                               //             ),
//                                               //         )
//                                               //         : Center(
//                                               //           child: Align(
//                                               //               child: Image.asset(
//                                               //                   "assets/image/cancel.png"),
//                                               //               alignment:
//                                               //                   FractionalOffset
//                                               //                       .center,
//                                               //             ),
//                                               //         ),
//                                               //   ],
//                                               // ),

//                                               // Adjust the height as needed
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15.0),
//                                                 image: DecorationImage(
//                                                   image: NetworkImage(
//                                                       speenWheelDataController
//                                                           .SpeenWheelData
//                                                           .value
//                                                           .seekerData![index]
//                                                           .imgPath),
//                                                   // Replace with your image path
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                       SizedBox(height: 10),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 20,bottom: 10),
//                                         child: Container(

//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(children: [
//                                                 Image.asset(data['image']!,height: 20,),
//                                                 SizedBox(
//                                                   width: Get.width * 0.003,
//                                                 ),
//                                                 Text(data['name']!,  style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 14,
//                                                   fontFamily: 'Inter',
//                                                   fontWeight: FontWeight.w500,

//                                                 ),)
//                                               ]),

//                                               Text(
//                                                 ' ${speenWheelDataController.SpeenWheelData.value.seekerData![index].name}',
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 20,
//                                                   fontFamily: 'Inter',
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),

//                                               Text(
//                                                 ' ${speenWheelDataController.SpeenWheelData.value.seekerData![index].address}',

//                                                 style: TextStyle(
//                                                   color: Color(0xFF777777),
//                                                   fontSize: 14,
            