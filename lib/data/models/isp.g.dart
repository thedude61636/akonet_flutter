// GENERATED CODE - DO NOT MODIFY BY HAND

part of isp;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Isp> _$ispSerializer = new _$IspSerializer();

class _$IspSerializer implements StructuredSerializer<Isp> {
  @override
  final Iterable<Type> types = const [Isp, _$Isp];
  @override
  final String wireName = 'Isp';

  @override
  Iterable serialize(Serializers serializers, Isp object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'ping',
      serializers.serialize(object.ping, specifiedType: const FullType(String)),
      'loss',
      serializers.serialize(object.loss, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'logo',
      serializers.serialize(object.logo, specifiedType: const FullType(String)),
      'lastup',
      serializers.serialize(object.lastUp,
          specifiedType: const FullType(String)),
      'lastdown',
      serializers.serialize(object.lastDown,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Isp deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IspBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ping':
          result.ping = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loss':
          result.loss = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastup':
          result.lastUp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastdown':
          result.lastDown = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Isp extends Isp {
  @override
  final String id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String ping;
  @override
  final String loss;
  @override
  final String time;
  @override
  final String logo;
  @override
  final String lastUp;
  @override
  final String lastDown;

  factory _$Isp([void Function(IspBuilder) updates]) =>
      (new IspBuilder()..update(updates)).build();

  _$Isp._(
      {this.id,
      this.name,
      this.status,
      this.ping,
      this.loss,
      this.time,
      this.logo,
      this.lastUp,
      this.lastDown})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Isp', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Isp', 'name');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('Isp', 'status');
    }
    if (ping == null) {
      throw new BuiltValueNullFieldError('Isp', 'ping');
    }
    if (loss == null) {
      throw new BuiltValueNullFieldError('Isp', 'loss');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('Isp', 'time');
    }
    if (logo == null) {
      throw new BuiltValueNullFieldError('Isp', 'logo');
    }
    if (lastUp == null) {
      throw new BuiltValueNullFieldError('Isp', 'lastUp');
    }
    if (lastDown == null) {
      throw new BuiltValueNullFieldError('Isp', 'lastDown');
    }
  }

  @override
  Isp rebuild(void Function(IspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IspBuilder toBuilder() => new IspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Isp &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        ping == other.ping &&
        loss == other.loss &&
        time == other.time &&
        logo == other.logo &&
        lastUp == other.lastUp &&
        lastDown == other.lastDown;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), name.hashCode),
                                status.hashCode),
                            ping.hashCode),
                        loss.hashCode),
                    time.hashCode),
                logo.hashCode),
            lastUp.hashCode),
        lastDown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Isp')
          ..add('id', id)
          ..add('name', name)
          ..add('status', status)
          ..add('ping', ping)
          ..add('loss', loss)
          ..add('time', time)
          ..add('logo', logo)
          ..add('lastUp', lastUp)
          ..add('lastDown', lastDown))
        .toString();
  }
}

class IspBuilder implements Builder<Isp, IspBuilder> {
  _$Isp _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _ping;
  String get ping => _$this._ping;
  set ping(String ping) => _$this._ping = ping;

  String _loss;
  String get loss => _$this._loss;
  set loss(String loss) => _$this._loss = loss;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  String _lastUp;
  String get lastUp => _$this._lastUp;
  set lastUp(String lastUp) => _$this._lastUp = lastUp;

  String _lastDown;
  String get lastDown => _$this._lastDown;
  set lastDown(String lastDown) => _$this._lastDown = lastDown;

  IspBuilder();

  IspBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _status = _$v.status;
      _ping = _$v.ping;
      _loss = _$v.loss;
      _time = _$v.time;
      _logo = _$v.logo;
      _lastUp = _$v.lastUp;
      _lastDown = _$v.lastDown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Isp other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Isp;
  }

  @override
  void update(void Function(IspBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Isp build() {
    final _$result = _$v ??
        new _$Isp._(
            id: id,
            name: name,
            status: status,
            ping: ping,
            loss: loss,
            time: time,
            logo: logo,
            lastUp: lastUp,
            lastDown: lastDown);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
