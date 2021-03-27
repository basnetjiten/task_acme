import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:task_acme/locator.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_request_model.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_response_model.dart';
class LyricService
    extends EitherService<LyricServiceRequestModel, LyricServiceResponseModel> {
  final String keywordPath;
  LyricService(this.keywordPath)
      : super(
            method: RestMethod.get,
            restApi: LyricAppLocator().api,
            path: 'Coldplay/$keywordPath');

  @override
  LyricServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return LyricServiceResponseModel.fromJSON(jsonResponse);
  }


}
