import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';
import 'package:test/test.dart';

void main() {
  LyricSearchViewModel lyricSearchViewModel;
  setUp((){
    lyricSearchViewModel= LyricSearchViewModel(
      artist: 'Queen',
      keyword: 'queen',
      lyrics: ''
    );

  });
  test('Instantiate LyricSearchViewModel', () async {
    expect(lyricSearchViewModel.artist, 'Queen');
    expect(lyricSearchViewModel.keyword, 'queen');
    expect(lyricSearchViewModel.lyrics, '');
  });

  test('AccountDetailViewModel initialize with error', () async {
    try {
      LyricSearchViewModel(
          artist: 'Queen',
          keyword: null,
          lyrics: 'initial'
      );
    } catch (error) {
      //'keyword != null && artist != null': is not true
      expect(error != null, true);
    }
  });
}
