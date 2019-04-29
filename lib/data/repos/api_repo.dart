import 'package:akonet_flutter/utils/consts.dart';
import 'package:dio/dio.dart';

Dio dioRepo = _DioRepo();

class _DioRepo extends Dio {
  _DioRepo() {
    options = BaseOptions(baseUrl: Links.API_URL);
  }
}
