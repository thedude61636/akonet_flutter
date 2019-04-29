import 'package:akonet_flutter/data/repos/api_repo.dart';
import 'package:akonet_flutter/utils/consts.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailsBloc extends Bloc<DetailsEvent, AsyncSnapshot<Details>> {
  @override
  AsyncSnapshot<Details> get initialState => AsyncSnapshot.nothing();

  @override
  Stream<AsyncSnapshot<Details>> mapEventToState(DetailsEvent event) async* {
    print("event is ${event.runtimeType}");
    if (event is RefreshDetails) {
      yield AsyncSnapshot.withData(ConnectionState.active, null);
      try {
        print("trying");
        Response dailyDowntimeStatsResponse =
            await dioRepo.get(Links.dailyDowntimeStats(event.ispId));
        print("got dayDown ${dailyDowntimeStatsResponse.data}");

        Response hourlyDowntimeStatsResponse =
            await dioRepo.get(Links.hourlyDowntimeStats(event.ispId));
        print("got hourDown ${hourlyDowntimeStatsResponse.data}");

        Response hourlyLossStatsResponse =
            await dioRepo.get(Links.hourlyLossStats(event.ispId));
        print("got hourLoss ${hourlyLossStatsResponse.data} ");

        Details details = Details(
            dailyDowntimeStats: dailyDowntimeStatsResponse.data.cast<int>(),
            hourlyDowntimeStats: hourlyDowntimeStatsResponse.data.cast<int>(),
            hourlyLossStats: hourlyLossStatsResponse.data.cast<int>());

        yield AsyncSnapshot.withData(ConnectionState.done, details);
      } on DioError catch (dioError) {
        print("error calling ${dioError.request.uri}");
        yield AsyncSnapshot.withError(ConnectionState.done, dioError.message);
      } catch (error) {
        yield AsyncSnapshot.withError(ConnectionState.done, error);
      }
    }
  }
}

class Details {
  List<int> dailyDowntimeStats;
  List<int> hourlyDowntimeStats;
  List<int> hourlyLossStats;

  Details(
      {this.dailyDowntimeStats,
      this.hourlyDowntimeStats,
      this.hourlyLossStats});
}

class DetailsEvent {}

class RefreshDetails extends DetailsEvent {
  String ispId;

  RefreshDetails(this.ispId);
}
