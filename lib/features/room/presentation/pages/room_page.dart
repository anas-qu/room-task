import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class RoomPage extends StatelessWidget {

  final List<String> imgList = [
    'assets/images/image1.png',
    'assets/images/image1.png',
    'assets/images/image1.png',
  ];

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
              IconButton(onPressed:(){},iconSize: 40,
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
       body:  Scrollbar(
          child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:screenHeight*0.2),
                Container(
                  width: screenWidth*0.9,
                  height:screenHeight,
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
                          child: Text('Part of Property Name',
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
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    ),)
    );

  }

}
