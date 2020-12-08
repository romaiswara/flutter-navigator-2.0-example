import 'package:flutter/material.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RoutePageBloc _bloc = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Column(
          children: [
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
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Reset to Home Page'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

                // navigator 2.0
                _bloc.goToHomePage(type: navigateType.pushRemoveUntil);

              },
            ),
          ],
        ),
      ),
    );
  }
}
