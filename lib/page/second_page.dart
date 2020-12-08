import 'package:flutter/material.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RoutePageBloc _bloc = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Third Page'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamed(context, '/third');

                // navigator 2.0
                _bloc.goToThirdPage();
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Third Page and replace'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushReplacementNamed(context, '/third');

                // navigator 2.0
                _bloc.goToThirdPage(type: navigateType.pushReplace);
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
              child: Text('Go to Third Page and remove all pages'),
              onPressed: () {
                // navigator 1.0
                // Navigator.pushNamedAndRemoveUntil(context, '/third', (route) => false);

                // navigator 2.0
                _bloc.goToThirdPage(type: navigateType.pushRemoveUntil);
              },
            ),
          ],
        ),
      ),
    );
  }
}
