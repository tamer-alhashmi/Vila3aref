class HotelPolicies {
  final String checkIn;
  final String checkOut;
  final String accommodationType;
  final String petPolicy;

  HotelPolicies({
    required this.checkIn,
    required this.checkOut,
    required this.accommodationType,
    required this.petPolicy,
  });

  factory HotelPolicies.fromJson(Map<String, dynamic> json) => HotelPolicies(
        checkIn: json["Check in"] ?? '',
        checkOut: json["Check out"] ?? '',
        accommodationType: json["Accommodation Type"] ?? '',
        petPolicy: json["Pet Policy"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Check in": checkIn,
        "Check out": checkOut,
        "Accommodation Type": accommodationType,
        "Pet Policy": petPolicy,
      };
}
