import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class WhoisthatoutsmarterModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => WhoisthatoutsmarterBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<WhoisthatoutsmarterModule>.of();
}
