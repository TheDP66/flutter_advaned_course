import 'package:flutter_advaned_course/features/feature_weather/domain/entities/suggest_city_entity.dart';

class SuggestCityModel extends SuggestCityEntity {
  SuggestCityModel.fromJson(dynamic json) {
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Links {
  String? rel;
  String? href;

  Links({this.rel, this.href});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['href'] = this.href;
    return data;
  }
}

class Data {
  int? id;
  String? wikiDataId;
  String? type;
  String? city;
  String? name;
  String? country;
  String? countryCode;
  String? region;
  String? regionCode;
  String? regionWdId;
  double? latitude;
  double? longitude;
  int? population;
  Null? distance;
  String? placeType;

  Data(
      {this.id,
      this.wikiDataId,
      this.type,
      this.city,
      this.name,
      this.country,
      this.countryCode,
      this.region,
      this.regionCode,
      this.regionWdId,
      this.latitude,
      this.longitude,
      this.population,
      this.distance,
      this.placeType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wikiDataId = json['wikiDataId'];
    type = json['type'];
    city = json['city'];
    name = json['name'];
    country = json['country'];
    countryCode = json['countryCode'];
    region = json['region'];
    regionCode = json['regionCode'];
    regionWdId = json['regionWdId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    population = json['population'];
    distance = json['distance'];
    placeType = json['placeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wikiDataId'] = this.wikiDataId;
    data['type'] = this.type;
    data['city'] = this.city;
    data['name'] = this.name;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['region'] = this.region;
    data['regionCode'] = this.regionCode;
    data['regionWdId'] = this.regionWdId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['population'] = this.population;
    data['distance'] = this.distance;
    data['placeType'] = this.placeType;
    return data;
  }
}

class Metadata {
  int? currentOffset;
  int? totalCount;

  Metadata({this.currentOffset, this.totalCount});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentOffset = json['currentOffset'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentOffset'] = this.currentOffset;
    data['totalCount'] = this.totalCount;
    return data;
  }
}
