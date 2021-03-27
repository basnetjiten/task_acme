import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_bloc.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';

import 'lyric_search_bloc_mock.dart';

void main() {
  LyricSearchBloc _lyricSearchBloc;
  LyricSearchBlocBlocMock lyricSearchBlocBlocMock;
  RepositoryScope _scope;
  setUp((){
    _lyricSearchBloc = LyricSearchBloc();
    lyricSearchBlocBlocMock = LyricSearchBlocBlocMock();
  });

  test('LyricSearchBloc gets view model, mock', () {

    lyricSearchBlocBlocMock.lyricSearchViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<LyricSearchViewModel>());
      expect(model.artist, 'Queen');
      expect(model.keyword.toString(), 'Queen');
      expect(model.lyrics.toString(), '');
    }));
  });
  //this would fail for real data
  test('LyricSearchBloc gets view model, real', () {

    //expectAsync1 takes on argument
    _lyricSearchBloc.lyricSearchViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<LyricSearchViewModel>());
      expect(model.keyword, 'Test');
      expect(model.artist, 'artist');
      expect(model.lyrics, 'test lyrics');
    }));
  });
}
