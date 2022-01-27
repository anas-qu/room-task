import 'package:flutter/material.dart';
class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth =  MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
        initialChildSize: 0.55,
        builder: (_, controller) => Scaffold(
          body: Center(
            child: Container(
              width:screenWidth*0.9 ,
              child: Column(
                children: [
                  //Heading (My Properties)
                  SizedBox(height:screenHeight*0.03),
                  Align(
                    alignment:Alignment.topLeft,
                    child: Text('Heading (My Properties)',
                      style:TextStyle(
                        fontFamily: 'Raleway-Regular',
                        fontSize: 20,
                        color: const Color(0xFF24253D),
                        fontWeight: FontWeight.bold,
                        letterSpacing:
                        0.17999998092651368,
                      ),
                    ),
                  ),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Add Property',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Properties History',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Help',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),

                  //Lorem Ipsum
                  SizedBox(height:screenHeight*0.03),
                  Align(
                    alignment:Alignment.topLeft,
                    child: Text('Lorem Ipsum',
                      style:TextStyle(
                        fontFamily: 'Raleway-Regular',
                        fontSize: 20,
                        color: const Color(0xFF24253D),
                        fontWeight: FontWeight.bold,
                        letterSpacing:
                        0.17999998092651368,
                      ),
                    ),
                  ),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Add Property',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Properties History',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height:screenHeight*0.02),
                  Row(
                    children: [
                      Icon(Icons.bookmarks_outlined,size: 25,color:Color(0xFF24253D)),
                      SizedBox(width:screenWidth*0.03),
                      Text('Help',
                        style:TextStyle(
                          fontFamily: 'Raleway-Regular',
                          fontSize: 20,
                          color: const Color(0xFF24253D),
                          letterSpacing:
                          0.17999998092651368,
                        ),
                      ),

                    ],
                  ),






                ],
              ),
            ),
          ),
        ));
  }
}
