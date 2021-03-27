import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_response_model.dart';

void main() {

  LyricService lyricService;
  setUp((){
    lyricService = LyricService('Adventure of a Lifetime');
  });
  test('LyricService success', () async {

    final eitherResponse = await lyricService.request();

    expect(eitherResponse.isRight, isTrue);
    //this would pass if exact lyrics fetched from backend is known
    /*expect(
      eitherResponse.fold((_) {}, (m) => m),
      LyricServiceResponseModel.fromJSON({
        'lyric': "Employee Checking",

      }),
    );*/
  });
}
