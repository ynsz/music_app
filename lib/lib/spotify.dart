import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

late SpotifiClient spotify;

Future setupSpotify() async {
  spotify = await SpotifiClient.initialize();
}

class SpotifiClient {
  late final String? token;
  static Dio dio = Dio();

  static Future<SpotifiClient> initialize() async {
    Response response = await Dio().post(
      "https://accounts.spotify.com/api/token",
      data: {
        "grant_type": "client_credentials",
        "client_id": dotenv.env["SPOTIFY_CLIENT_ID"],
        "client_secret": dotenv.env["SPOTIFY_CLIENT_SECRET"],
      },
      options: Options(
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      ),
    );
    SpotifiClient spotify = SpotifiClient();
    spotify.token = response.data["access_token"];
    return spotify;
  }

  dynamic getPopularSongs() async {
    Response response = await dio.get(
      "https://api.spotify.com/v1/playlists/5SLPaOxQyJ8Ne9zpmTOvSe/tracks",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    return response.data["items"].map((item) => item["track"]);
  }
}
