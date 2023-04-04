// ignore_for_file: public_member_api_docs, sort_constructors_first
class Location {
  String? city;
  String? country;
  String? countryCode;
  String? region;
  String? regionName;
  String? zip;
  String? timezone;
  double? lat;
  double? lon;

  Location({
    this.city,
    this.country,
    this.countryCode,
    this.region,
    this.regionName,
    this.zip,
    this.timezone,
    this.lat,
    this.lon,
  });

  Location.fromJson(Map<String, dynamic> json) {
    city = json["city"];
    country = json["country_name"];
    countryCode = json["country_code"];
    region = json["region"];
    regionName = json["region_code"];
    zip = json["postal"];
    lat = json["latitude"];
    lon = json["longitude"];

    timezone = json["timezone"];
  }
}
