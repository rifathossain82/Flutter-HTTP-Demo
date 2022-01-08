
class Data{
  int id;
  String name,username,email,phone,website;
  Address address;
  Company company;

  Data(this.id, this.name, this.username, this.email, this.phone, this.website,
      this.address, this.company);

  Data.fromJson(dynamic json):
        id=json['id'],
        name=json['name'],
        username=json['username'],
        email=json['email'],
        address=Address.fromJson(json['address']),
        phone=json['phone'],
        website=json['website'],
        company=Company.fromJson(json['company']);

}



class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Address.fromJson(dynamic json):
    street = json['street'],
    suite = json['suite'],
    city = json['city'],
    zipcode = json['zipcode'],
    geo =Geo.fromJson(json['geo']);

}

class Geo {
  String lat;
  String lng;

  Geo(this.lat, this.lng);

  Geo.fromJson(dynamic json):
    lat = json['lat'],
    lng = json['lng'];
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company(this.name, this.catchPhrase, this.bs);

  Company.fromJson(dynamic json):
    name = json['name'],
    catchPhrase = json['catchPhrase'],
    bs = json['bs'];
}