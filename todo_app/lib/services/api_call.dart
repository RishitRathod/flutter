import 'package:http/http.dart' as http;
class APICall{
  static fetchTodos() async {
    var request = http.Request('GET', Uri.parse('https://node-todo-api-yjo3.onrender.com/todos/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
}