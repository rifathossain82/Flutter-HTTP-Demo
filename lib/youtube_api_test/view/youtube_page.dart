import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_demo/youtube_api_test/model/videoData.dart';
import 'package:http/http.dart' as http;

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key}) : super(key: key);

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {

  late Future<List<Video>> get_;

  Future<List<Video>> getVideo()async {
    List<Video> videoList = [];
    int videoLength = 0;

    try {
      final response = await http.get(Uri.parse('https://api.newstube.app/apiv2/api/read.php'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Data load success');
        var data = VideoData.fromJson(jsonDecode(response.body));
        videoList = data.body ?? [];
        videoLength = data.itemCount ?? 0;

        return videoList;
      }
      else {
        print("Data load failed");
        return videoList;
      }
    } catch (e) {
      print(e);
      return videoList;
    }
  }

  @override
  void initState() {
    get_ = getVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: get_,
        builder: (context, AsyncSnapshot<List<Video>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data![index].ntVideotitle!),
                );
              },
            );
          }
          else{
            return const Center(
              child: Text('404\nPage Not Found'),
            );
          }

        },
      ),
    );
  }
}
