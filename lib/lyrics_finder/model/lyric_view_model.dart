import 'package:clean_framework/clean_framework.dart';

class LyricSearchViewModel extends ViewModel {
  final String keyword;
  final String artist;
  final String lyrics;
  final serviceStatus;
  final dataStatus;

  LyricSearchViewModel({this.keyword, this.artist,this.lyrics, this.serviceStatus = LyricServiceStatus.unknown, this.dataStatus = LyricDataStatus.unknown})
      : assert(keyword != null && artist != null);

  @override
  List<Object> get props => [keyword, artist, serviceStatus, dataStatus];
}

enum LyricServiceStatus { initial,processing,success, fail, unknown }
enum LyricDataStatus { valid, invalid, unknown }
