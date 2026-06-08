import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "http://YOUR_IP/api/"),
  );

  Future post(String path, data) => dio.post(path, data: data);
  Future get(String path) => dio.get(path);
}

class AuthService {
  final api = ApiClient();

  Future sendOtp(String phone) async {
    await api.post("send-otp/", {"phone": phone});
  }

  Future verifyOtp(String phone, String code) async {
    final res = await api.post("verify-otp/", {
      "phone": phone,
      "code": code
    });

    return res.statusCode == 200;
  }
}