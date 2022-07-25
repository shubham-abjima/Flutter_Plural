import 'package:http/http.dart' as http;

void useHttpRead() async {
  var contents = await http.read(Uri.parse("http://127.0.0.1:5000/program"));
  print(contents);
}

void useHttpGet(int program_id) async {
  var response =
      await http.get(Uri.parse('http://127.0.0.1:5000/program/$program_id'));
  print(response.body);
  print(response.statusCode);
}

void useHttpPost() async {
  var response = await http.post(Uri.parse('http://127.0.0.1:5000/program'));
  print(response);
}

void main() {
  useHttpRead();
  // useHttpGet(2);
  // useHttpPost()
}
