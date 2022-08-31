// To parse this JSON data, do
//
//     final itemModel2 = itemModel2FromJson(jsonString);

import 'dart:convert';

List<ItemModel2> itemModel2FromJson(String str) =>
    List<ItemModel2>.from(json.decode(str).map((x) => ItemModel2.fromJson(x)));

String itemModel2ToJson(List<ItemModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel2 {
  ItemModel2({
    required this.data,
    required this.id,
    required this.logo,
    required this.text,
  });

  final List<Datum> data;
  final int id;
  final String logo;
  final String text;

  factory ItemModel2.fromJson(Map<String, dynamic> json) => ItemModel2(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        id: json["id"],
        logo: json["logo"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "id": id,
        "logo": logo,
        "text": text,
      };
}

class Datum {
  Datum({
    required this.jobtype,
    required this.address,
    required this.availability,
    required this.contact,
    required this.experience,
    required this.gender,
    required this.id,
    required this.name,
    required this.preferedworkarea,
    required this.servicetype,
  });

  final String jobtype;
  final String address;
  final String availability;
  final String contact;
  final String experience;
  final String gender;
  final int id;
  final String name;
  final String preferedworkarea;
  final String servicetype;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jobtype: json[" jobtype"],
        address: json["address"],
        availability: json["availability"],
        contact: json["contact"],
        experience: json["experience"],
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        preferedworkarea: json["preferedworkarea"],
        servicetype: json["servicetype"],
      );

  Map<String, dynamic> toJson() => {
        " jobtype": jobtype,
        "address": address,
        "availability": availability,
        "contact": contact,
        "experience": experience,
        "gender": gender,
        "id": id,
        "name": name,
        "preferedworkarea": preferedworkarea,
        "servicetype": servicetype,
      };
}
