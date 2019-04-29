library isp;

import 'dart:convert';

import 'package:akonet_flutter/data/serializers.dart';
import 'package:akonet_flutter/utils/consts.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'isp.g.dart';

abstract class Isp implements Built<Isp, IspBuilder> {
  Isp._();

  factory Isp([updates(IspBuilder b)]) = _$Isp;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'ping')
  String get ping;

  @BuiltValueField(wireName: 'loss')
  String get loss;

  @BuiltValueField(wireName: 'time')
  String get time;

  @BuiltValueField(wireName: 'logo')
  String get logo;

  @BuiltValueField(wireName: 'lastup')
  String get lastUp;

  @BuiltValueField(wireName: 'lastdown')
  String get lastDown;

  String toJson() {
    return json.encode(serializers.serializeWith(Isp.serializer, this));
  }

  static Isp fromJson(Map<String, dynamic> map) {
    return serializers.deserializeWith(Isp.serializer, map);
  }

  static Serializer<Isp> get serializer => _$ispSerializer;

  String get getLogo {
    return Links.IMAGE_BASE_URL + logo;
  }
}
