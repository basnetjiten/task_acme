import 'package:clean_framework/clean_framework.dart';

class LyricSearchEntity extends Entity {
  final String keyword;
  final String artist;
  final String lyrics;

  LyricSearchEntity(
      {List<EntityFailure> errors = const [], String keyword,String artist,String lyrics})
      : keyword = keyword ?? 'Test',
      lyrics=lyrics ?? 'initial lyrics',
      artist=artist?? 'Coldplay',
        super(errors: errors);

  @override
  List<Object> get props => [keyword, artist,errors,lyrics];

  @override
  merge({errors, String keyword,String artist,String lyrics}) {
    return LyricSearchEntity(
        errors: errors ?? this.errors,
        keyword: keyword ?? this.keyword,
        artist: artist ?? this.artist,
        lyrics: lyrics?? this.lyrics);
  }
}
