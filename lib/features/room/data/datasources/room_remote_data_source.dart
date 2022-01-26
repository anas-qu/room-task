import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:room_task/core/error/exceptions.dart';
import 'package:room_task/features/room/data/model/room_model.dart';

abstract class RoomRemoteDataSource
{
  Future<Rooms> getRoom();
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final http.Client client;
  RoomRemoteDataSourceImpl({required this.client});

  @override
  Future<Rooms> getRoom() =>_getroomFromUrl('https://privatestays.app/api/single_property/14');

  Future<Rooms> _getroomFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200)
      return Rooms.fromJson(json.decode(response.body));
    throw ServerException();
  }


}