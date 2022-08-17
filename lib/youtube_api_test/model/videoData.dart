class VideoData {
  List<Video>? body;
  int? itemCount;

  VideoData({this.body, this.itemCount});

  VideoData.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Video>[];
      json['body'].forEach((v) {
        body!.add(Video.fromJson(v));
      });
    }
    itemCount = json['itemCount'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    data['itemCount'] = itemCount;
    return data;
  }
}

class Video {
  String? ntVideoid;
  String? ntVideotitle;
  String? ntCategoryname;
  String? ntVideoembed;
  String? ntVideothumbnail;

  Video(
      {this.ntVideoid,
        this.ntVideotitle,
        this.ntCategoryname,
        this.ntVideoembed,
        this.ntVideothumbnail});

  Video.fromJson(Map<dynamic, dynamic> json) {
    ntVideoid = json['nt_videoid'];
    ntVideotitle = json['nt_videotitle'];
    ntCategoryname = json['nt_categoryname'];
    ntVideoembed = json['nt_videoembed'];
    ntVideothumbnail = json['nt_videothumbnail'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data['nt_videoid'] = ntVideoid;
    data['nt_videotitle'] = ntVideotitle;
    data['nt_categoryname'] = ntCategoryname;
    data['nt_videoembed'] = ntVideoembed;
    data['nt_videothumbnail'] = ntVideothumbnail;
    return data;
  }
}
