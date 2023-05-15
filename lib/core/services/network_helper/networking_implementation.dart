import 'package:http/http.dart' as http;
import 'package:temperature/core/services/network_helper/networking.dart';

class NetworkHelper implements INetworkHelper{

  final client = http.Client();
    
  @override  
  Future<HttpResponse> get(String url) async {    
    final response = await client.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
  
  @override
  Future<HttpResponse> post(String endPoint, Map<String, dynamic> data) {    
    throw UnimplementedError();
  }


}
