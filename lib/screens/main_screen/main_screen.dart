import 'package:akonet_flutter/data/models/isp.dart';
import 'package:akonet_flutter/generated/i18n.dart';
import 'package:akonet_flutter/screens/details_screen/details_screen.dart';
import 'package:akonet_flutter/screens/main_screen/main_bloc.dart';
import 'package:akonet_flutter/widgets/material_status_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MainBloc();
    bloc.dispatch(RefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_name),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, AsyncSnapshot<List<Isp>> state) {
//          print("state is ${state}");

          if (state.hasData) {
            print("has data");
            var ispList = state.data;
            return RefreshIndicator(
                child: ListView.builder(
                  itemCount: ispList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Isp isp = ispList[index];
                    return IspWidget(
                        isp: isp,
                        onTap: (isp) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsScreen(isp: isp);
                          }));
                        });
                  },
                ),
                onRefresh: () async {
                  bloc.dispatch(RefreshEvent());
                  return;
                });
          }
          return StatusWidget(
            snapshot: state,
            action: () {
              bloc.dispatch(RefreshEvent());
            },
          );
        },
      ),
    );
  }
}

typedef OnTap(Isp isp);

class IspWidget extends StatelessWidget {
  final OnTap onTap;

  const IspWidget({
    Key key,
    @required this.isp,
    this.onTap,
  }) : super(key: key);

  final Isp isp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          this.onTap(isp);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: isp.getLogo,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        isp.name ?? "",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text((isp.ping ?? "") == "0"
                          ? S.of(context).ping_unkown
                          : S.of(context).ping_value(isp.ping)),
                      Text(S.of(context).last_down_value(isp.lastDown)),
                      Text(S.of(context).last_up_value(isp.lastUp)),
                    ],
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(isp.status == "1" ? "Up" : "Down"),
                    ),
                    Visibility(
                      visible: isp.status == "0",
                      child: Icon(
                        Icons.info,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
