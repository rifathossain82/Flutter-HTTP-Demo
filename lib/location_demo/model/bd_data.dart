class Division{
  String id;
  String name;
  String bn_name;
  String lat;
  String long;

  Division(this.id, this.name, this.bn_name, this.lat, this.long);
}

class District{
  String id;
  String division_id;
  String name;
  String bn_name;
  String lat;
  String long;

  District(
      this.id, this.division_id, this.name, this.bn_name, this.lat, this.long);
}

class Upazila{
  String id;
  String district_id;
  String name;
  String bn_name;

  Upazila(this.id, this.district_id, this.name, this.bn_name);


}

class PostCode{
  String? division_id;
  String? district_id;
  String? upazila;
  String? postOffice;
  String? postCode;

  PostCode(this.division_id, this.district_id, this.upazila, this.postOffice,
      this.postCode);


}