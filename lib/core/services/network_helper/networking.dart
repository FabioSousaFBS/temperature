

abstract class INetworkHelper{  
  
  Future<HttpResponse> get(String url);  

  Future<HttpResponse> post(String endPoint, Map<String, dynamic> data);  

}


class HttpResponse {

  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});

}


