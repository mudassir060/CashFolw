// ignore_for_file: constant_identifier_names

import 'dart:async';

enum AppBarAction {
  PayPerClick,
  Dashboard,
  Profile,
  PostADS,
  Deposit,
  Withdraw,
  Plan,
  Referral,
  ADSView,
}

class AppBarBloc {
  late String Titel;
  final stateStreamController = StreamController<String>();
  StreamSink<String> get TitelSink => stateStreamController.sink;
  Stream<String> get TitelStream => stateStreamController.stream;

  final eventStreamController = StreamController<AppBarAction>();
  StreamSink<AppBarAction> get eventSink => eventStreamController.sink;
  Stream<AppBarAction> get eventStream => eventStreamController.stream;

  AppBarBloc() {
    Titel = "Pay Per Click";
    eventStream.listen((event) {
      if (event == AppBarAction.PayPerClick) {
        Titel = 'Pay Per Click';
      } else if (event == AppBarAction.Dashboard) {
        Titel = 'Dashboard';
      } else if (event == AppBarAction.Profile) {
        Titel = 'Profile';
      } else if (event == AppBarAction.PostADS) {
        Titel = 'Post ADS';
      } else if (event == AppBarAction.Deposit) {
        Titel = 'Deposit';
      } else if (event == AppBarAction.Withdraw) {
        Titel = 'Plan';
      } else if (event == AppBarAction.Referral) {
        Titel = 'Referral';
      } else if (event == AppBarAction.ADSView) {
        Titel = 'ADS View';
      }
      TitelSink.add(Titel);
    print(event);
    });
  }
}
