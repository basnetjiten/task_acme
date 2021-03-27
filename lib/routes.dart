import 'package:flutter/material.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_feature_widget.dart';

abstract class LyricFinderRouter {
  static const String initialRoute = '/';


  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LyricsFeatureWidget();


      default:
        return const PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404, Page Not Found!')));
  }
}
