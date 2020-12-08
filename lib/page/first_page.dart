import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoutePageBloc _bloc = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Second Page'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamed(context, '/second');

                // navigator 2.0
                _bloc.goToSecondPage();
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Second Page and replace'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushReplacementNamed(context, '/second');

                // navigator 2.0
                _bloc.goToSecondPage(type: navigateType.pushReplace);
              },
            ),
          ],
        ),
      ),
    );
  }
}
