class HotelCategory {
  final String deluxeDoubleRoomEnsuite;
  final String familyRoomDeluxeEnsuiteWithkitchenette;
  final String tripleRoomDeluxeEnsuite;
  final String standardDoubleRoomEnsuite;
  final String twinRoomStandardEnsuite;

  HotelCategory({
    required this.deluxeDoubleRoomEnsuite,
    required this.familyRoomDeluxeEnsuiteWithkitchenette,
    required this.standardDoubleRoomEnsuite,
    required this.tripleRoomDeluxeEnsuite,
    required this.twinRoomStandardEnsuite,
  });
}

class DeluxeDoubleRoomEnsuite {
  final String catname;
  final String categorydescreption;
  final String roomsize;
  final String amenities;

  DeluxeDoubleRoomEnsuite({
    required this.amenities,
    required this.categorydescreption,
    required this.catname,
    required this.roomsize,
  });
}

class FamilyRoomDeluxeEnsuiteWithkitchenette {
  final String catname;
  final String categorydescreption;
  final String roomsize;
  final String amenities;

  FamilyRoomDeluxeEnsuiteWithkitchenette({
    required this.amenities,
    required this.categorydescreption,
    required this.catname,
    required this.roomsize,
  });
}

class StandardDoubleRoomEnsuite {
  final String catname;
  final String categorydescreption;
  final String roomsize;
  final String amenities;

  StandardDoubleRoomEnsuite({
    required this.amenities,
    required this.categorydescreption,
    required this.catname,
    required this.roomsize,
  });
}

class TripleRoomDeluxeEnsuite {
  final String catname;
  final String categorydescreption;
  final String roomsize;
  final String amenities;

  TripleRoomDeluxeEnsuite({
    required this.amenities,
    required this.categorydescreption,
    required this.catname,
    required this.roomsize,
  });
}

class TwinRoomStandardEnsuite {
  final String catname;
  final String categorydescreption;
  final String roomsize;
  final String amenities;

  TwinRoomStandardEnsuite({
    required this.amenities,
    required this.categorydescreption,
    required this.catname,
    required this.roomsize,
  });
}

class CategoryAmenities {
  final String amenities;
  CategoryAmenities(this.amenities);
}
