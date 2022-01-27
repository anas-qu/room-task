import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:room_task/features/room/data/datasources/room_remote_data_source.dart';

import 'package:room_task/features/room/presentation/widgets/heading.dart';
class RoomPage extends StatefulWidget {

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final List<String> imgList = [
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image1.png',
  ];
  late Future<Rooms> roomsList;
  @override
  void initState() {
    super.initState();
    roomsList = getRoomList() ;
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth =  MediaQuery.of(context).size.width;
    const _initialCam = CameraPosition(target: LatLng(37.773972, -122.431297),zoom: 11.5);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(110),
          child:AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed:(){},
              icon: Icon(Icons.arrow_back),color: Color(0xFFF5D40B),
              iconSize:40,
            ),
            centerTitle: true,
            title: Text('Room Name',style:TextStyle(color: Color(0xFF24253D))),
            actions: [
              IconButton(onPressed:()=>showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled:true,
                  context: context, builder:(context)=>Heading()
              ),iconSize: 40,
                icon: Icon(Icons.menu),color: Color(0xFFF5D40B),),
            ],
            elevation: 5,
            bottom: TabBar(
              indicatorColor: Color(0xFFF5D40B),
              tabs: [
                Text('Info',style:
                TextStyle(
                  fontFamily: 'Raleway-Regular',
                  fontSize: 22,
                  color: const Color(0xFF24253D),
                  letterSpacing:
                  0.17999998092651368,
                ),),
                Text('Reviews',
                    style:TextStyle(
                      fontFamily: 'Raleway-Regular',
                      fontSize: 22,
                      color: const Color(0xff9b9b9b),
                      letterSpacing:
                      0.17999998092651368,
                    ),),
              ],
            ),
          ),
        ),
       body:   FutureBuilder<Rooms>(
         future: roomsList,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return Stack(
               children: [
                 Scrollbar(
                   child: SingleChildScrollView(
                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SizedBox(height:screenHeight*0.2),
                           Container(
                             width: screenWidth*0.9,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(16.0),
                             ),
                             alignment: Alignment.topCenter,
                             child: Container(
                               width: screenWidth * 0.8,
                               child: Column(
                                 children: [
                                   SizedBox(height:screenHeight*0.01),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(snapshot.data!.title,
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 17,
                                         color: const Color(0xff9b9b9b),
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     children: [
                                       Icon(Icons.calendar_today_rounded,color:Color(0xfff5d40b),size:25,),
                                       SizedBox(width: screenWidth*0.02,),
                                       Text(
                                         'Hotel',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(
                                               0xfff5d40b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth*0.20,),
                                       Icon(Icons.star,color:Color(0xfff5d40b),size:25,),
                                       Icon(Icons.star,color:Color(0xfff5d40b),size:25,),
                                       Icon(Icons.star,color:Color(0xfff5d40b),size:25,),
                                       Icon(Icons.star,color:Color(0xfff5d40b),size:25,),
                                       Icon(Icons.star,color:Color(0xff9b9b9b),size:25,),
                                       SizedBox(width: screenWidth*0.02,),
                                       Text(
                                         '4.3',
                                         style: TextStyle(
                                           fontFamily:
                                           'Raleway-Regular',
                                           fontSize: 20,
                                           color: const Color(
                                               0xfff5d40b),
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.03),
                                   Container(
                                       height:screenHeight*0.25 ,
                                       child: CarouselSlider(
                                         options: CarouselOptions(),
                                         items: imgList
                                             .map((item) => Container(
                                           child: ClipRRect(
                                               borderRadius: BorderRadius.circular(16.0),
                                               child: Image.asset(item,fit:BoxFit.cover,width: screenWidth * 0.8)),
                                         )).toList(),
                                       )),
                                   SizedBox(height:screenHeight*0.01),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Facilities',
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 22,
                                         color: const Color(0xff9b9b9b),
                                         fontWeight: FontWeight.bold,
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     children: [
                                       Icon(Icons.wifi,color:Color(0xfff5d40b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.coffee,color:Color(0xff9b9b9b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.bathtub,color:Color(0xff9b9b9b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.car_rental,color:Color(0xfff5d40b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.pets,color:Color(0xff9b9b9b),size:30,),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         'Free \nWife',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.3/5,),
                                       Text(
                                         'Breakfast',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.17/5,),
                                       Text(
                                         'Free Wife',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.2/5,),
                                       Text(
                                         'Parking',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.3/5,),
                                       Text(
                                         'Pet \nAllowed',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),
                                         textAlign:TextAlign.center,
                                       ),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Icon(Icons.liquor,color:Color(0xff9b9b9b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.security,color:Color(0xff9b9b9b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.access_time,color:Color(0xfff5d40b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.tv,color:Color(0xff9b9b9b),size:30,),
                                       SizedBox(width: screenWidth * 0.51/5,),
                                       Icon(Icons.sports_football,color:Color(0xfff5d40b),size:30,),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                         'Beer \nClub',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.3/5,),
                                       Text(
                                         'Security',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.2/5,),
                                       Text(
                                         'Open 24/7',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.16/5,),
                                       Text(
                                         'Television',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                       SizedBox(width: screenWidth * 0.15/5,),
                                       Text(
                                         'FootBall',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 13,
                                           color: const Color(
                                               0xff9b9b9b),
                                           letterSpacing:
                                           0.16714290142059327,
                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.02),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Hotel Description',
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 22,
                                         color: const Color(0xff9b9b9b),
                                         fontWeight: FontWeight.bold,
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.015),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child:Text(
                                       '218 Austen Mountain, consectetur adipiscing, do eiusmod tempor incididunt ut labore et dolore',
                                       style: TextStyle(
                                         fontFamily:
                                         'Raleway-Regular',
                                         fontSize: 15,
                                         color: const Color(
                                             0xff444444),
                                       ),
                                     ),),
                                   SizedBox(height:screenHeight*0.015),
                                   Text(
                                     'See Details',
                                     style: TextStyle(
                                       fontFamily:
                                       'Raleway-Regular',
                                       fontSize: 14,
                                       color: const Color(
                                           0xfff5d40b),
                                       letterSpacing:
                                       0.15428569793701172,
                                     ),
                                   ),
                                   Divider(color: Colors.grey),
                                   SizedBox(height:screenHeight*0.01),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Location',
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 22,
                                         color: const Color(0xff9b9b9b),
                                         fontWeight: FontWeight.bold,
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.015),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child:Text(
                                       '218 Austen Mountain, consectetur adipiscing, \nsed do eiusmod tempor incididunt ut labore e',
                                       style: TextStyle(
                                         fontFamily:
                                         'Raleway-Regular',
                                         fontSize: 15,
                                         color: const Color(
                                             0xff444444),
                                       ),
                                     ),),
                                   Container(
                                       height:screenHeight*0.25 ,
                                       child:GoogleMap(
                                         myLocationButtonEnabled: false,
                                         zoomControlsEnabled: false,
                                         initialCameraPosition: _initialCam,
                                       )),
                                   SizedBox(height:screenHeight*0.02),
                                   Divider(color: Colors.grey),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Important Information',
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 22,
                                         color: const Color(0xff9b9b9b),
                                         fontWeight: FontWeight.bold,
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.02),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Max number of guests',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 20,
                                           color: const Color(0xff24253d),
                                           letterSpacing:
                                           0.20571426391601563,
                                           fontWeight: FontWeight.w500,
                                         ),
                                         textAlign: TextAlign.left,
                                       ),

                                       Text(
                                         '4',
                                         style: TextStyle(
                                           fontFamily: 'Raleway-Regular',
                                           fontSize: 16,
                                           color: const Color(0xff24253d),
                                           letterSpacing:
                                           0.20571426391601563,
                                           fontWeight: FontWeight.w600,
                                         ),
                                         textAlign: TextAlign.right,
                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Number of rooms',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 20,
                                           color: const Color(0xff24253d),
                                           letterSpacing:
                                           0.20571426391601563,
                                           fontWeight: FontWeight.w500,
                                         ),
                                         textAlign: TextAlign.left,
                                       ),
                                       Text(
                                         '2',
                                         style: TextStyle(
                                           fontFamily: 'Raleway-Regular',
                                           fontSize: 16,
                                           color: const Color(0xff24253d),
                                           letterSpacing:
                                           0.20571426391601563,
                                           fontWeight: FontWeight.w600,
                                         ),
                                         textAlign: TextAlign.right,
                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.02),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(
                                       'Daily Uses',
                                       style: TextStyle(
                                         fontFamily: 'Raleway',
                                         fontSize: 20,
                                         color: const Color(0xff24253d),
                                         letterSpacing:
                                         0.20571426391601563,
                                         fontWeight: FontWeight.w500,
                                       ),
                                       textAlign: TextAlign.left,
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Chick in form',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 20,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         'Chick out form',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 20,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,
                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     children: [
                                       Text(
                                         '15.00',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       SizedBox(width: screenWidth*0.35,),
                                       Text(
                                         '18.00',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),

                                   SizedBox(height:screenHeight*0.02),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(
                                       'Overnight',
                                       style: TextStyle(
                                         fontFamily: 'Raleway',
                                         fontSize: 20,
                                         color: const Color(0xff24253d),
                                         letterSpacing:
                                         0.20571426391601563,
                                         fontWeight: FontWeight.w500,
                                       ),
                                       textAlign: TextAlign.left,
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Chick in form',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         'Chick out form',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     children: [
                                       Text(
                                         '15.00',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       SizedBox(width: screenWidth*0.35,),
                                       Text(
                                         '18.00',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),

                                   SizedBox(height:screenHeight*0.02),
                                   Divider(color: Colors.grey),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Prices',
                                       style:TextStyle(
                                         fontFamily: 'Raleway-Regular',
                                         fontSize: 22,
                                         color: const Color(0xff9b9b9b),
                                         fontWeight: FontWeight.bold,
                                         letterSpacing:
                                         0.17999998092651368,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.02),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(
                                       'Daily Uses',
                                       style: TextStyle(
                                         fontFamily: 'Raleway',
                                         fontSize: 20,
                                         color: const Color(0xff24253d),
                                         letterSpacing:
                                         0.20571426391601563,
                                         fontWeight: FontWeight.w500,
                                       ),
                                       textAlign: TextAlign.left,
                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Adult',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         '49.99',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Children',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         '49.99',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Infants',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         'Free',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),

                                   SizedBox(height:screenHeight*0.02),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(
                                       'Overnight',
                                       style: TextStyle(
                                         fontFamily: 'Raleway',
                                         fontSize: 20,
                                         color: const Color(0xff24253d),
                                         letterSpacing:
                                         0.20571426391601563,

                                       ),

                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Adult',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         '49.99',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Children',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 17,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,
                                         ),
                                       ),
                                       Text(
                                         '49.99',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         'Infants',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 20,
                                           color: const Color(0xff9b9b9b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                       Text(
                                         'Free',
                                         style: TextStyle(
                                           fontFamily: 'Raleway',
                                           fontSize: 15,
                                           color: const Color(0xfff5d40b),
                                           letterSpacing:
                                           0.20571426391601563,

                                         ),

                                       ),
                                     ],
                                   ),
                                   SizedBox(height:screenHeight*0.03),
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(height:screenHeight*0.03),
                           Container(
                               width: screenWidth * 0.8,
                               child: Column(
                                 children: [
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text('Similar Properties',style:
                                     TextStyle(
                                       fontFamily: 'Raleway-Regular',
                                       fontSize: 22,
                                       color: const Color(0xFF24253D),
                                       letterSpacing:
                                       0.17999998092651368,
                                     ),),
                                   ),
                                   Align(
                                     alignment:Alignment.topLeft,
                                     child: Text(
                                       'Check Out these properties too',
                                       style: TextStyle(
                                         fontFamily: 'Raleway',
                                         fontSize: 17,
                                         color: const Color(0xff9b9b9b),
                                         letterSpacing:
                                         0.20571426391601563,

                                       ),

                                     ),
                                   ),
                                   SizedBox(height:screenHeight*0.01),
                                   Container(
                                     height: screenHeight*0.25,
                                     child: ListView(
                                       scrollDirection: Axis.horizontal,
                                       children: [
                                         buildCard(screenHeight,screenHeight ),
                                         SizedBox(width:screenWidth*0.04),
                                         buildCard(screenHeight,screenHeight ),
                                         SizedBox(width:screenWidth*0.04),
                                         buildCard(screenHeight,screenHeight ),
                                         SizedBox(width:screenWidth*0.04),
                                         buildCard(screenHeight,screenHeight ),
                                         SizedBox(width:screenWidth*0.04),
                                       ],
                                     ),

                                   ),
                                   SizedBox(height:screenHeight*0.15),
                                 ],
                               )
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   bottom: 0,
                   child: Container(
                       width: screenWidth,
                       height: screenHeight*0.1,
                       color: Colors.white,
                       alignment: Alignment.center,
                       child: InkWell(
                         onTap: (){},
                         child: Container(
                           width: screenWidth * 0.9,
                           height: screenHeight*0.08,
                           decoration: BoxDecoration(
                             color: Color(0xfff5d40b),
                             borderRadius: BorderRadius.circular(16.0),
                           ),
                           child:Center(
                             child: Text(
                               'Reserve',
                               style: TextStyle(
                                 fontFamily: 'Raleway',
                                 fontSize: 25,
                                 color: const Color(0xff24253d),
                                 letterSpacing: 0.20571426391601563,
                               ),
                               textAlign: TextAlign.center,
                             ),
                           ),
                         ),
                       )
                   ),
                 )
               ],
             );
           } else if (snapshot.hasError) {
             return Text('${snapshot.error}');
           }
           // By default, show a loading spinner.
           return const CircularProgressIndicator();
         },
       ),





      ),

    );

  }

Widget buildCard(screenHeight,screenWidth ){
    return Container(
      width:screenWidth*0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
      Container(
          height: screenHeight*0.15,
          width:screenWidth*0.2,
        child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset('assets/images/image1.png',fit:BoxFit.cover,)
    ),
      ),
          Row(
            children: [
              Icon(Icons.add_location,color: Colors.red,size:15,),
              Text(
                'Guadeloupe',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  color: const Color(0xff9b9b9b),
                  letterSpacing:
                  0.20571426391601563,
                ),
              ),
            ],
          ),
          Align(
            alignment:Alignment.topLeft,
            child: Text('Felix Hotel-Morocco',style:
            TextStyle(
              fontFamily: 'Raleway-Regular',
              fontSize: 17,
              color: const Color(0xFF24253D),
              letterSpacing:
              0.17999998092651368,
            ),),
          ),

          Row(
            children: [
              Icon(Icons.star,color:Color(0xfff5d40b),size:15,),
              Icon(Icons.star,color:Color(0xfff5d40b),size:15,),
              Icon(Icons.star,color:Color(0xfff5d40b),size:15,),
              Icon(Icons.star,color:Color(0xfff5d40b),size:15,),
              Icon(Icons.star,color:Color(0xff9b9b9b),size:15,),

              Text(
                '100 reviews',
                style: TextStyle(
                  fontFamily:
                  'Raleway-Regular',
                  fontSize: 14,
                  color: const Color(
                      0xff9b9b9b),
                ),

              ),
            ],
          ),
          Align(
            alignment:Alignment.topLeft,
            child: Text('\$125',style:
            TextStyle(
              fontFamily: 'Raleway-Regular',
              fontSize: 20,
              color: const Color(0xfff5d40b),
              letterSpacing:
              0.17999998092651368,
            ),),
          ),

        ],
      ),
    );
}
}
