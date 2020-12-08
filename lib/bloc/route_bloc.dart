import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_20_with_bloc/page/details_page.dart';
import 'package:flutter_navigator_20_with_bloc/page/first_page.dart';
import 'package:flutter_navigator_20_with_bloc/page/home_page.dart';
import 'package:flutter_navigator_20_with_bloc/page/second_page.dart';
import 'package:flutter_navigator_20_with_bloc/page/third_page.dart';
import 'package:flutter_navigator_20_with_bloc/page/unknown_page.dart';

enum navigateType {
  push,
  pushReplace,
  pushRemoveUntil,
}

class RoutePageState extends Equatable {
  final List<Page> pages;

  RoutePageState({this.pages});

  @override
  List<Object> get props => [pages];
}

class RoutePageBloc extends Cubit<RoutePageState> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int detailId = 0;

  RoutePageBloc()
      : super(RoutePageState(
          pages: [
            MaterialPage(
              child: HomePage(),
              key: const Key('HomePage'),
              name: '/',
            )
          ],
        ));

  void didPop(Page page) {
    List<Page> list = List.from(state.pages);
    list.remove(page);
    emit(RoutePageState(pages: list));
  }

  Future<void> setNewRoutePath(String configuration) async {
    final uri = Uri.parse(configuration);
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'details') {
        var remaining = uri.pathSegments[1];
        detailId = int.tryParse(remaining) - 1;
        goToDetailsPage();
      }
    } else {
      if (configuration == '/first') {
        goToFirstPage();
      } else if (configuration == '/second') {
        goToSecondPage();
      } else if (configuration == '/third') {
        goToThirdPage();
      } else if (configuration == '/') {
        goToHomePage();
      } else {
        goToUnknownPage();
      }
    }
  }

  void goToUnknownPage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    list.add(MaterialPage(
      child: UnknownPage(),
      key: const Key('UnknownPage'),
      name: '/404',
    ));

    emit(RoutePageState(pages: list));
  }

  void goToHomePage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    list.clear();
    detailId = 0;

    list.add(MaterialPage(
      child: HomePage(),
      key: const Key('HomePage'),
      name: '/',
    ));

    emit(RoutePageState(pages: list));
  }

  void goToFirstPage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    if (type == navigateType.push) {
      // do nothing
    } else if (type == navigateType.pushReplace) {
      list.removeAt(list.length - 1);
    } else {
      list.clear();
    }

    list.add(
      MaterialPage(
        child: FirstPage(),
        key: const Key('FisrtPage'),
        name: '/first',
      ),
    );

    emit(RoutePageState(pages: list));
  }

  void goToSecondPage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    if (type == navigateType.push) {
      // do nothing
    } else if (type == navigateType.pushReplace) {
      list.removeAt(list.length - 1);
    } else {
      list.clear();
    }

    list.add(
      MaterialPage(
        child: SecondPage(),
        key: const Key('SecondPage'),
        name: '/second',
      ),
    );

    emit(RoutePageState(pages: list));
  }

  void goToThirdPage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    if (type == navigateType.push) {
      // do nothing
    } else if (type == navigateType.pushReplace) {
      list.removeAt(list.length - 1);
    } else {
      list.clear();
    }

    list.add(
      MaterialPage(
        child: ThirdPage(),
        key: const Key('ThirdPage'),
        name: '/third',
      ),
    );

    emit(RoutePageState(pages: list));
  }

  void goToDetailsPage({navigateType type = navigateType.push}) {
    List<Page> list = List.from(state.pages);

    if (type == navigateType.push) {
      // do nothing
    } else if (type == navigateType.pushReplace) {
      list.removeAt(list.length - 1);
    } else {
      list.clear();
    }

    detailId++;

    list.add(
      MaterialPage(
        child: DetailsPage(id: detailId),
        key: UniqueKey(),
        name: '/details/$detailId',
      ),
    );

    emit(RoutePageState(pages: list));
  }
}
