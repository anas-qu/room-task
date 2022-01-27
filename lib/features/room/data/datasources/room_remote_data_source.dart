import 'dart:convert';
import 'package:http/http.dart'as http;
String roomJsonURL = 'https://privatestays.app/api/single_property/14';
Future<Rooms>  getRoomList() async {
  final response = await http.get(Uri.parse(roomJsonURL));
  if (response.statusCode == 200) {
    return Rooms.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load album');
  }
}
List<Rooms> roomFromJson(String str) => List<Rooms>.from(
    json.decode(str).map((x) => Rooms.fromJson(x)));

Rooms roomsFromJson(String str) => Rooms.fromJson(json.decode(str));
String roomsToJson(Rooms data) => json.encode(data.toJson());

class Rooms {
  Rooms({
    required this.id,
    required this.owner,
    required this.ownerImg,
    required this.date,
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.address,
    required this.panoramicImages,
    required this.pricePerDay,
    required this.pricePerNight,
    required this.minGuests,
    required this.maxGuests,
    required this.guestsPerNight,
    required this.guestsnightUse,
    required this.amenities,
    required this.longitude,
    required this.latitude,
    required this.comments,
    required this.images,
    required this.map,
    required this.available,
    required this.rating,
    required this.reviews,
    required this.phone,
    required this.bookingDates,
    required this.relatedProperties,
    required this.canReview,
    required this.report,
    required this.virtualUrl,
    required this.checkInDay,
    required this.checkOutDay,
    required this.checkInNight,
    required this.checkOutNight,
    required this.checkInOvernight,
    required this.checkOutOvernight,
    required this.overNightActive,
    required this.dayUseActive,
    required this.nightUseActive,
  });

  int id;
  String owner;
  String ownerImg;
  String date;
  String title;
  String description;
  String featuredImage;
  String address;
  List<dynamic> panoramicImages;
  String pricePerDay;
  String pricePerNight;
  int minGuests;
  int maxGuests;
  int guestsPerNight;
  int guestsnightUse;
  List<Amenity> amenities;
  int longitude;
  int latitude;
  List<dynamic> comments;
  List<String> images;
  String map;
  bool available;
  int rating;
  int reviews;
  String phone;
  List<dynamic> bookingDates;
  List<RelatedProperty> relatedProperties;
  bool canReview;
  List<dynamic> report;
  dynamic virtualUrl;
  String checkInDay;
  String checkOutDay;
  String checkInNight;
  String checkOutNight;
  String checkInOvernight;
  String checkOutOvernight;
  bool overNightActive;
  bool dayUseActive;
  bool nightUseActive;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
    id: json["id"],
    owner: json["owner"],
    ownerImg: json["owner_img"],
    date: json["date"],
    title: json["title"],
    description: json["description"],
    featuredImage: json["featured_image"],
    address: json["address"],
    panoramicImages: List<dynamic>.from(json["panoramic_images"].map((x) => x)),
    pricePerDay: json["price_per_day"],
    pricePerNight: json["price_per_night"],
    minGuests: json["min_guests"],
    maxGuests: json["max_guests"],
    guestsPerNight: json["guestsPerNight"],
    guestsnightUse: json["guestsnightUse"],
    amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
    longitude: json["longitude"],
    latitude: json["latitude"],
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    images: List<String>.from(json["images"].map((x) => x)),
    map: json["map"],
    available: json["available"],
    rating: json["rating"],
    reviews: json["reviews"],
    phone: json["phone"],
    bookingDates: List<dynamic>.from(json["booking_dates"].map((x) => x)),
    relatedProperties: List<RelatedProperty>.from(json["related_properties"].map((x) => RelatedProperty.fromJson(x))),
    canReview: json["canReview"],
    report: List<dynamic>.from(json["report"].map((x) => x)),
    virtualUrl: json["virtual_url"],
    checkInDay: json["checkInDay"],
    checkOutDay: json["checkOutDay"],
    checkInNight: json["checkInNight"],
    checkOutNight: json["checkOutNight"],
    checkInOvernight: json["checkInOvernight"],
    checkOutOvernight: json["checkOutOvernight"],
    overNightActive: json["overNightActive"],
    dayUseActive: json["dayUseActive"],
    nightUseActive: json["nightUseActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner": owner,
    "owner_img": ownerImg,
    "date": date,
    "title": title,
    "description": description,
    "featured_image": featuredImage,
    "address": address,
    "panoramic_images": List<dynamic>.from(panoramicImages.map((x) => x)),
    "price_per_day": pricePerDay,
    "price_per_night": pricePerNight,
    "min_guests": minGuests,
    "max_guests": maxGuests,
    "guestsPerNight": guestsPerNight,
    "guestsnightUse": guestsnightUse,
    "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
    "longitude": longitude,
    "latitude": latitude,
    "comments": List<dynamic>.from(comments.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
    "map": map,
    "available": available,
    "rating": rating,
    "reviews": reviews,
    "phone": phone,
    "booking_dates": List<dynamic>.from(bookingDates.map((x) => x)),
    "related_properties": List<dynamic>.from(relatedProperties.map((x) => x.toJson())),
    "canReview": canReview,
    "report": List<dynamic>.from(report.map((x) => x)),
    "virtual_url": virtualUrl,
    "checkInDay": checkInDay,
    "checkOutDay": checkOutDay,
    "checkInNight": checkInNight,
    "checkOutNight": checkOutNight,
    "checkInOvernight": checkInOvernight,
    "checkOutOvernight": checkOutOvernight,
    "overNightActive": overNightActive,
    "dayUseActive": dayUseActive,
    "nightUseActive": nightUseActive,
  };
}

class Amenity {
  Amenity({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}

class RelatedProperty {
  RelatedProperty({
    required this.id,
    required this.title,
    required this.pricePerDay,
    required this.pricePerNight,
    required this.minGuests,
    required this.maxGuests,
    required this.rating,
    required this.reviews,
    required this.days,
    required this.featuredImage,
  });

  int id;
  String title;
  String pricePerDay;
  String pricePerNight;
  int minGuests;
  int maxGuests;
  int rating;
  int reviews;
  String days;
  String featuredImage;

  factory RelatedProperty.fromJson(Map<String, dynamic> json) => RelatedProperty(
    id: json["id"],
    title: json["title"],
    pricePerDay: json["price_per_day"],
    pricePerNight: json["price_per_night"],
    minGuests: json["min_guests"],
    maxGuests: json["max_guests"],
    rating: json["rating"],
    reviews: json["reviews"],
    days: json["days"],
    featuredImage: json["featured_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price_per_day": pricePerDay,
    "price_per_night": pricePerNight,
    "min_guests": minGuests,
    "max_guests": maxGuests,
    "rating": rating,
    "reviews": reviews,
    "days": days,
    "featured_image": featuredImage,
  };
}
