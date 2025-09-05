import 'dart:convert';
import 'dart:math';
import 'package:braga_resolve/Models/userComment/userComment.dart';
import 'package:http/http.dart' as http;

class UserCommentsRepository {
  Future<List<UserComment>> loadComments(int quantity) async {
    List<UserComment> userComments = [];

    try {
      for (var i = 0; i < quantity; i++) {
        int random = Random().nextInt(100);

        final String avatarUrl = "https://picsum.photos/id/$random/200/300";

        final String loremApi =
            "https://jsonplaceholder.typicode.com/posts/$random";
        final loremResponse = await http.get(Uri.parse(loremApi));

        if (loremResponse.statusCode != 200) {
          throw Exception("Erro ao buscar lorem ipsum do comentário");
        }

        final loremJson = json.decode(loremResponse.body);
        final loremText = loremJson["body"];
        final id = loremJson["id"];
        final name = loremJson["title"];

        final unifiedJson = {
          "id": id,
          "avatar": avatarUrl,
          "name": name,
          "comment": loremText,
        };

        userComments.add(UserComment.fromJson(unifiedJson));
      }

      return userComments;
    } catch (e) {
      throw Exception("Erro ao buscar comentários: $e");
    }
  }
}
