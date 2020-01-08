import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:silicon_beach_space/models/actions.dart';
import 'package:silicon_beach_space/models/app_state.dart';
import 'package:silicon_beach_space/models/user.dart';
import 'package:silicon_beach_space/widgets/auth_page.dart';
import 'package:silicon_beach_space/widgets/main_page.dart';

class SpaceApp extends StatefulWidget {
  SpaceApp(this.store);
  final Store<AppState> store;
  @override
  _SpaceAppState createState() => _SpaceAppState();
}

class _SpaceAppState extends State<SpaceApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(Action.ObserveAuthState());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoreProvider<AppState>(
        store: widget.store,
        child: StoreConnector<AppState, User>(
          distinct: true,
          converter: (store) => store.state.user,
          builder: (context, user) {
            return (user == null || user.uid == null) ? AuthPage() : MainPage();
          },
        ),
      ),
    );
  }
}
