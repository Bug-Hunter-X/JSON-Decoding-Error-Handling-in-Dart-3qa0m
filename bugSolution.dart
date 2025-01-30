```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        //Check if the key exists before accessing it
        if (jsonData.containsKey('key')){
          print(jsonData['key']);
        } else {
          print('Key not found in JSON response');
        }
      } on FormatException catch (e) {
        print('Invalid JSON format: $e');
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('HTTP request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
```