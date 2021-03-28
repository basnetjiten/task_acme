import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:task_acme/locator.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_service_adapter.dart';
import 'package:task_acme/lyrics_finder/model/lyric_entity.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';

class LyricSearchUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;
  LyricAppLocator _lyricAppLocator;

  LyricSearchUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null){
    _viewModelCallBack = viewModelCallBack;
    _lyricAppLocator = LyricAppLocator();
}



  void create() async {
    //check if repository has any instance of loginEntity
    _scope = _lyricAppLocator.repository.containsScope<LyricSearchEntity>();
    if (_scope == null) {

      //if null create one and register in repository
      final newLyricEntity = LyricSearchEntity();
      //create new scope if no scope found for for that entity
      _scope = _lyricAppLocator.repository.create<LyricSearchEntity>(newLyricEntity,_notifySubscribers);
      _viewModelCallBack(buildViewModelForLocalUpdate(newLyricEntity));

    } else {
      print("flowwww");
      //initialize subscription for scope
      _scope.subscription = _notifySubscribers;
    }

   //get the entity finally
    final entity = LyricAppLocator().repository.get<LyricSearchEntity>(_scope);

    //build viewModelCallBack based on the entity
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void submit() async {

    final entity = LyricAppLocator().repository.get<LyricSearchEntity>(_scope);

    if (entity.keyword == '' || entity.artist == '') {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      _viewModelCallBack(buildViewModelProcessing(entity));
      //finally run the service adapter to request api for responseModel
      await _lyricAppLocator
          .repository
          .runServiceAdapter(_scope, LyricServiceAdapter(keyword: entity.keyword));
    }
  }

  void updateKeyword(String keywords) async {
    final entity = _lyricAppLocator.repository.get<LyricSearchEntity>(_scope);
    final updatedEntity = entity.merge(keyword: keywords,artist: 'ColdPlay');
    _lyricAppLocator.repository.update<LyricSearchEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }


  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  LyricSearchViewModel buildViewModelForServiceUpdate(LyricSearchEntity entity) {
   print(entity.hasErrors().toString());
    if (entity.hasErrors()) {
      return LyricSearchViewModel(
          artist: entity.artist,
          keyword: entity.keyword,
          serviceStatus: LyricServiceStatus.fail);
    } else {
      return LyricSearchViewModel(
          artist: entity.artist,
          keyword: entity.keyword,
          lyrics: entity.lyrics,
          serviceStatus: LyricServiceStatus.success);
    }
  }

  LyricSearchViewModel buildViewModelForLocalUpdate(LyricSearchEntity entity) {
    final lyricsModel= LyricSearchViewModel(
        artist: entity.artist,
        keyword: entity.keyword,
        lyrics:entity.lyrics,
        serviceStatus: LyricServiceStatus.initial);

    return lyricsModel;
  }
  LyricSearchViewModel buildViewModelProcessing(LyricSearchEntity entity) {
    final lyricsModel= LyricSearchViewModel(
        artist: entity.artist,
        keyword: entity.keyword,
        lyrics:entity.lyrics,
        serviceStatus: LyricServiceStatus.processing);

    return lyricsModel;
  }

  LyricSearchViewModel buildViewModelForLocalUpdateWithError(LyricSearchEntity entity) {
    return LyricSearchViewModel(
        artist: entity.artist,
        keyword: entity.keyword,
        lyrics:entity.lyrics,
        dataStatus: LyricDataStatus.invalid);
  }
}
