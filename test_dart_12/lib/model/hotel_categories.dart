
class Categories {
  final DeluxeDoubleRoomEnsuite deluxeDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite familyRoomDeluxeEnsuiteKitchenette;
  final DeluxeDoubleRoomEnsuite tripleRoomDeluxeEnsuite;
  final DeluxeDoubleRoomEnsuite standardDoubleRoomEnsuite;
  final DeluxeDoubleRoomEnsuite twinRoomStandardEnsuite;

  Categories({
    required this.deluxeDoubleRoomEnsuite,
    required this.familyRoomDeluxeEnsuiteKitchenette,
    required this.tripleRoomDeluxeEnsuite,
    required this.standardDoubleRoomEnsuite,
    required this.twinRoomStandardEnsuite,
  });

  Categories copyWith({
    DeluxeDoubleRoomEnsuite? deluxeDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? familyRoomDeluxeEnsuiteKitchenette,
    DeluxeDoubleRoomEnsuite? tripleRoomDeluxeEnsuite,
    DeluxeDoubleRoomEnsuite? standardDoubleRoomEnsuite,
    DeluxeDoubleRoomEnsuite? twinRoomStandardEnsuite,
  }) =>
      Categories(
        deluxeDoubleRoomEnsuite: deluxeDoubleRoomEnsuite ?? this.deluxeDoubleRoomEnsuite,
        familyRoomDeluxeEnsuiteKitchenette: familyRoomDeluxeEnsuiteKitchenette ?? this.familyRoomDeluxeEnsuiteKitchenette,
        tripleRoomDeluxeEnsuite: tripleRoomDeluxeEnsuite ?? this.tripleRoomDeluxeEnsuite,
        standardDoubleRoomEnsuite: standardDoubleRoomEnsuite ?? this.standardDoubleRoomEnsuite,
        twinRoomStandardEnsuite: twinRoomStandardEnsuite ?? this.twinRoomStandardEnsuite,
      );

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    deluxeDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["DeluxeDoubleRoomEnsuite"]),
    familyRoomDeluxeEnsuiteKitchenette: DeluxeDoubleRoomEnsuite.fromJson(json["FamilyRoomDeluxeEnsuite_kitchenette"]),
    tripleRoomDeluxeEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["TripleRoomDeluxeEnsuite"]),
    standardDoubleRoomEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["StandardDoubleRoomEnsuite"]),
    twinRoomStandardEnsuite: DeluxeDoubleRoomEnsuite.fromJson(json["TwinRoomStandardEnsuite"]),
  );

  Map<String, dynamic> toJson() => {
    "DeluxeDoubleRoomEnsuite": deluxeDoubleRoomEnsuite.toJson(),
    "FamilyRoomDeluxeEnsuite_kitchenette": familyRoomDeluxeEnsuiteKitchenette.toJson(),
    "TripleRoomDeluxeEnsuite": tripleRoomDeluxeEnsuite.toJson(),
    "StandardDoubleRoomEnsuite": standardDoubleRoomEnsuite.toJson(),
    "TwinRoomStandardEnsuite": twinRoomStandardEnsuite.toJson(),
  };
}

class DeluxeDoubleRoomEnsuite {
  final int personNumber;
  final Catname catname;
  final String categorydescreption;
  final Roomsize roomsize;

  DeluxeDoubleRoomEnsuite({
    required this.personNumber,
    required this.catname,
    required this.categorydescreption,
    required this.roomsize,
  });

  DeluxeDoubleRoomEnsuite copyWith({
    int? personNumber,
    Catname? catname,
    String? categorydescreption,
    Roomsize? roomsize,
  }) =>
      DeluxeDoubleRoomEnsuite(
        personNumber: personNumber ?? this.personNumber,
        catname: catname ?? this.catname,
        categorydescreption: categorydescreption ?? this.categorydescreption,
        roomsize: roomsize ?? this.roomsize,
      );

  factory DeluxeDoubleRoomEnsuite.fromJson(Map<String, dynamic> json) => DeluxeDoubleRoomEnsuite(
    personNumber: json["personNumber"],
    catname: catnameValues.map[json["catname"]]!,
    categorydescreption: json["categorydescreption"],
    roomsize: roomsizeValues.map[json["roomsize"]]!,
  );

  Map<String, dynamic> toJson() => {
    "personNumber": personNumber,
    "catname": catnameValues.reverse[catname],
    "categorydescreption": categorydescreption,
    "roomsize": roomsizeValues.reverse[roomsize],
  };
}


enum Catname {
  DELUXE_DOUBLE_ROOM_ENSUITE,
  FAMILY_ROOM_DELUXE_ENSUITE_WITH_KITCHENETTE,
  STANDARD_DOUBLE_ROOM_ENSUITE,
  TRIPLE_ROOM_DELUXE_ENSUITE,
  TWIN_ROOM_STANDARD_ENSUITE
}

final catnameValues = EnumValues({
  "Deluxe Double Room Ensuite": Catname.DELUXE_DOUBLE_ROOM_ENSUITE,
  "Family room-Deluxe Ensuite with kitchenette": Catname.FAMILY_ROOM_DELUXE_ENSUITE_WITH_KITCHENETTE,
  "Standard Double Room Ensuite": Catname.STANDARD_DOUBLE_ROOM_ENSUITE,
  "Triple Room Deluxe Ensuite": Catname.TRIPLE_ROOM_DELUXE_ENSUITE,
  "Twin Room Standard Ensuite": Catname.TWIN_ROOM_STANDARD_ENSUITE
});

enum Roomsize {
  THE_11_MSQ_118_FTSQ,
  THE_13_MSQ_140_FTSQ,
  THE_15_MSQ_161_FTSQ,
  THE_20_MSQ_215_FTSQ,
  THE_25_MSQ_269_FTSQ
}

final roomsizeValues = EnumValues({
  "11/MSQ, 118/FTSQ": Roomsize.THE_11_MSQ_118_FTSQ,
  "13/MSQ, 140/FTSQ": Roomsize.THE_13_MSQ_140_FTSQ,
  "15/MSQ, 161/FTSQ": Roomsize.THE_15_MSQ_161_FTSQ,
  "20/MSQ, 215/FTSQ": Roomsize.THE_20_MSQ_215_FTSQ,
  "25/MSQ, 269/FTSQ": Roomsize.THE_25_MSQ_269_FTSQ
});

enum Image {
  RUSSELL_1_JPG,
  THE_1_JPG,
  THE_2_JPG,
  THE_3_JPG,
  THE_4_JPG,
  THE_5_JPG,
  THE_6_JPG,
  THE_7_JPG
}

final imageValues = EnumValues({
  "Russell_1.jpg": Image.RUSSELL_1_JPG,
  "1.jpg": Image.THE_1_JPG,
  "2.jpg": Image.THE_2_JPG,
  "3.jpg": Image.THE_3_JPG,
  "4.jpg": Image.THE_4_JPG,
  "5.jpg": Image.THE_5_JPG,
  "6.jpg": Image.THE_6_JPG,
  "7.jpg": Image.THE_7_JPG
});

class LikeDislike {
  final int likes;
  final int dislikes;
  final int userAction;

  LikeDislike({
    required this.likes,
    required this.dislikes,
    required this.userAction,
  });

  LikeDislike copyWith({
    int? likes,
    int? dislikes,
    int? userAction,
  }) =>
      LikeDislike(
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
        userAction: userAction ?? this.userAction,
      );

  factory LikeDislike.fromJson(Map<String, dynamic> json) => LikeDislike(
    likes: json["likes"],
    dislikes: json["dislikes"],
    userAction: json["userAction"],
  );

  Map<String, dynamic> toJson() => {
    "likes": likes,
    "dislikes": dislikes,
    "userAction": userAction,
  };
}

// enum Reception {
//   MANNED,
//   UNMANNED
// }
//
// final receptionValues = EnumValues({
//   "manned": Reception.MANNED,
//   "unmanned": Reception.UNMANNED
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
