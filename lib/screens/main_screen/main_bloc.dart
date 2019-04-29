import 'package:akonet_flutter/data/models/isp.dart';
import 'package:akonet_flutter/data/repos/api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class MainBloc extends Bloc<MainEvent, AsyncSnapshot<List<Isp>>> {
  @override
  AsyncSnapshot<List<Isp>> get initialState => AsyncSnapshot.nothing();

  @override
  Stream<AsyncSnapshot<List<Isp>>> mapEventToState(MainEvent event) async* {
    print("getting index");
    if (event is RefreshEvent) {
      Response response;
      yield AsyncSnapshot.withData(ConnectionState.active, null);
      try {
        response = await dioRepo.get('index');

        var isps = (response.data as List).map((t) {
          print(t.runtimeType);
          return Isp.fromJson(t);
        }).toList();

        yield AsyncSnapshot.withData(ConnectionState.done, isps);
      } on DioError catch (dioError) {

        yield AsyncSnapshot.withError(ConnectionState.done, dioError.message);
      } catch(error){
        yield AsyncSnapshot.withError(ConnectionState.done, error);
      }
    }
  }
}

class MainEvent {}

class RefreshEvent extends MainEvent {}
