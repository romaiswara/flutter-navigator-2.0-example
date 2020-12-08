import 'package:flutter/material.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoutePageBloc _bloc = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Main Page'),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to First Page'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamed(context, '/first');

                // navigator 2.0
                _bloc.goToFirstPage();
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Details Page'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamed(context, '/details', arguments: 1);

                // navigator 2.0
                _bloc.goToDetailsPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
