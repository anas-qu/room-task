import 'package:flutter/material.dart';
class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(100),
          child:AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed:(){},icon: Icon(Icons.arrow_back),color: Color(0xFFF5D40B),),
            centerTitle: true,

            title: Text('Room Name',textAlign: TextAlign.center,style:TextStyle(color: Color(0xFF24253D))),
            actions: [
              IconButton(onPressed:(){},icon: Icon(Icons.menu),color: Color(0xFFF5D40B),),
            ],
            elevation: 2,
            bottom: TabBar(
              indicatorColor: Color(0xFFF5D40B),
              tabs: [
                Text('Info',style:TextStyle(color: Color(0xFF24253D))),
              InkWell(onTap:null,
              child: Text('Reviews',style:TextStyle(color: Colors.grey[500])),)  ,
              ],
            ),
          ),
        )

      ),
    );

  }
}
