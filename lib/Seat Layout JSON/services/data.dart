class cc {
  String t;

  cc({required this.t});

  cc.fromJson(Map<String, dynamic> json):
    t = json['t'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    return data;
  }
}