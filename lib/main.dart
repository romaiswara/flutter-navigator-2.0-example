import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_20_with_bloc/bloc/route_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RoutePageBloc bloc = RoutePageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: MaterialApp.router(
        title: 'Navigator 2.0 with Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: TheAppRouterDelegateBloc(bloc: bloc),
        routeInformationParser: TheAppRouteInformationParser(),
      ),
    );
  }
}

class TheAppRouterDelegateBloc extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final RoutePageBloc bloc;

  TheAppRouterDelegateBloc({this.bloc}) {
    bloc.listen((val) {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutePageBloc, RoutePageState>(
      builder: (context, state) {
        return Navigator(
          key: bloc.navigatorKey,
          onPopPage: _onPopPage,
          pages: List.of(state.pages),
        );
      },
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    bloc.didPop(route.settings);

    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => bloc.navigatorKey;

  @override
  String get currentConfiguration => bloc.state.pages.last.name;

  @override
  Future<void> setNewRoutePath(String configuration) async {
    await bloc.setNewRoutePath(configuration);
  }
}

class TheAppRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(
      RouteInformation routeInformation) async {
    return routeInformation.location;
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    if (configuration == '/') {
      return RouteInformation(location: '/');
    }
    if (configuration == '/first') {
      return RouteInformation(location: '/first');
    }
    if (configuration == '/second') {
      return RouteInformation(location: '/second');
    }
    if (configuration == '/third') {
      return RouteInformation(location: '/third');
    }
    if (configuration.contains('/details')) {
      return RouteInformation(location: configuration);
    }
    if (configuration == '/404') {
      return RouteInformation(location: configuration);
    }
    return null;
  }
}
