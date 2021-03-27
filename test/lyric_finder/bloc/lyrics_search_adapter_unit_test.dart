import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service_response_model.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_service_adapter.dart';
import 'package:task_acme/lyrics_finder/model/lyric_entity.dart';

void main() {
  LyricSearchEntity initialLyricSearchEntity;
  LyricServiceAdapter lyricServiceAdapter;
  group('SERVICE ADAPTER METHOD TEST', ()
  {
    setUp(() {
      initialLyricSearchEntity = LyricSearchEntity();
      lyricServiceAdapter = LyricServiceAdapter();
    });

    test(
        'new instance of LyricSearchEntity is Created by ServiceAdapter with updated data from ResponseModel',
            () {
          final lyricEntity = lyricServiceAdapter.createEntity(
              initialLyricSearchEntity,
              LyricServiceResponseModel.fromJSON(
                  {'lyrics': 'lyrics fetched from the backend api'}));
          //we expect entity is created based on above test
          //this test should pass
          expect(lyricEntity,
              LyricSearchEntity(lyrics: 'lyrics fetched from the backend api'));
        });



    //NoSuchMethodError: The method 'merge' was called on null.
    //replace null with initialLyricSearchEntity to pass the test
    test(
        'null instance of Entity provider should fail',
            () {
          final lyricEntity = lyricServiceAdapter.createEntity(
              null,
              LyricServiceResponseModel.fromJSON(
                  {'lyrics': 'lyrics fetched from the backend api'}));

          expect(lyricEntity, LyricSearchEntity(lyrics: 'lyrics fetched from the backend api'));
        });
  });}
