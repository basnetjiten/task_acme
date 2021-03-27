import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_bloc.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_presenter.dart';
class LyricsFeatureWidget extends StatefulWidget {
  @override
  _LoginFeatureWidgetState createState() => _LoginFeatureWidgetState();
}

class _LoginFeatureWidgetState extends State<LyricsFeatureWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LyricSearchBloc(),
      child: Scaffold(
          body: LyricsFinderPresenter()),
    );
  }
}
