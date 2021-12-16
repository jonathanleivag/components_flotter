import 'package:components_flotter/views/alert_view.dart';
import 'package:components_flotter/views/animited_container.dart';
import 'package:components_flotter/views/avatat_view.dart';
import 'package:components_flotter/views/card_view.dart';
import 'package:components_flotter/views/input_view.dart';
import 'package:components_flotter/views/list_view.dart';
import 'package:components_flotter/views/scroll_view.dart';
import 'package:components_flotter/views/slider_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRouter() => <String, WidgetBuilder>{
      'home': (BuildContext context) => const ListViewApp(),
      'alert': (BuildContext context) => const AlertView(),
      'avatar': (BuildContext context) => const AvatarView(),
      'card': (BuildContext context) => const CardView(),
      'animatedContainer': (BuildContext context) =>
          const AnimatedContainerView(),
      'inputs': (BuildContext context) => const InputsView(),
      'slider': (BuildContext constext) => const SliderView(),
      'scroll': (BuildContext constext) => const ScrollView0()
    };
