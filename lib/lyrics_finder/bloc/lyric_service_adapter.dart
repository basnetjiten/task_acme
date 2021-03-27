
import 'package:clean_framework/clean_framework.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_request_model.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_response_model.dart';
import 'package:task_acme/lyrics_finder/model/lyric_entity.dart';

class LyricServiceAdapter extends ServiceAdapter<LyricSearchEntity,
    LyricServiceRequestModel, LyricServiceResponseModel, LyricService> {
final String keyword;
  LyricServiceAdapter({this.keyword}) : super(LyricService(keyword));

  @override
  LyricServiceRequestModel createRequest(LyricSearchEntity entity) {
    return LyricServiceRequestModel(
        artist: entity.artist, title: entity.keyword);
  }

  @override
  LyricSearchEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[],lyrics:responseModel.lyrics);
  }

}
