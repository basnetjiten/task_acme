import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_bloc.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';


class LyricSearchBlocBlocMock extends Fake implements LyricSearchBloc {
  final lyricSearchViewModelPipe = Pipe<LyricSearchViewModel>();

  LyricSearchBlocBlocMock() {
    lyricSearchViewModelPipe.whenListenedDo(() {
      lyricSearchViewModelPipe.send(LyricSearchViewModel(
          artist: 'Queen', keyword: 'Queen', lyrics: ''));
    });
  }

  @override
  void dispose() {}
}
