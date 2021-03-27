import 'package:task_acme/lyrics_finder/model/lyric_entity.dart';
import 'package:test/test.dart';

void main() {
  LyricSearchEntity lyricSearchEntity;
  LyricSearchEntity lyricSearchEntityMergeWithError;
  setUp((){

    lyricSearchEntity=LyricSearchEntity(
      artist: 'coldplay',
      lyrics: 'test lyric',
      keyword: 'coldplay',
    );

    lyricSearchEntityMergeWithError=LyricSearchEntity(
      errors: [],
      artist: 'coldplay',
      lyrics: 'test lyric',
      keyword: 'coldplay',
    );
  });
  test('LyricEntity instantiation and properties test', () {

    expect(lyricSearchEntity.artist, 'coldplay');
    expect(lyricSearchEntity.lyrics, 'test lyric');
    expect(lyricSearchEntity.keyword, 'coldplay');

    expect(
      lyricSearchEntity.toString(),
      'LyricSearchEntity(coldplay, coldplay, [], test lyric)',
    );
  });

  test('LyricSearchEntity merge with null errors', () {

    final  LyricSearchEntity errorMergedEntity = lyricSearchEntityMergeWithError.merge(errors: null);
    expect(errorMergedEntity, isA<LyricSearchEntity>());
    expect(errorMergedEntity.errors, []);
    expect(errorMergedEntity.artist, 'coldplay');
    expect(errorMergedEntity.keyword, 'coldplay');
    expect(errorMergedEntity.lyrics, 'test lyric');

    expect(
      errorMergedEntity.toString(),
      'LyricSearchEntity(coldplay, coldplay, [], test lyric)',
    );
  });
}
