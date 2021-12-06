import 'package:http/http.dart' as http;

class ServerConnection {
  final _svrUrl = 'https://script.google.com/macros/s/AKfycbyjGpqDz_7i25JvIoI6MJBQloiBT241r2boXBTS3OA3jkDEJnU/exec';

  Future<String> select(String table) async {
    final url = Uri.parse(_svrUrl + '?action=1&table=' + table);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Response status: ${response.statusCode}';
    }
  }

  Future<String> insert(String table, String data) async{
    var url = Uri.parse(_svrUrl);
    var response = await http.post(url, body: {'action': '2', 'table': table, 'data': data});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Response status: ${response.statusCode}';
    }
  }
  
  Future<String> getProducts(String idtienda) async {
    final url = Uri.parse(_svrUrl+'?acc=3&idt='+idtienda);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }else{
      return 'Response status: ${response.statusCode}';
    }
  }
}

