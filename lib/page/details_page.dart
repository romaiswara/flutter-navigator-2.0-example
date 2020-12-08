import 'package:flutter/material.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final int id;

  DetailsPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoutePageBloc _bloc = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text('Details $id'),
      ),
      body: Center(
        child: Column(children: [
          Text(
            '$id',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 20),
          OutlineButton(
            child: Text('Open Details'),
            onPressed: () {
              // navigator 1.0
              // Navigator.pushNamed(context, '/details');

              // navigator 2.0
              _bloc.goToDetailsPage();
            },
          ),
          SizedBox(height: 20),
          OutlineButton(
            child: Text('Reset to home'),
            onPressed: () {
              // navigator 1.0
              // Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

              // navigator 2.0
              _bloc.goToHomePage(type: navigateType.pushRemoveUntil);
            },
          ),
        ]),
      ),
    );
  }
}
