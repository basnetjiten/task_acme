
import 'package:clean_framework/clean_framework.dart';
import 'package:task_acme/lyrics_finder/api/lyric_service.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_usecase.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';

class LyricSearchBloc extends Bloc {
  LyricSearchUseCase _lyricSearchUseCase;

  final lyricSearchViewModelPipe = Pipe<LyricSearchViewModel>();
  final keywordPipe = Pipe<String>();
  final submitPipe = EventPipe();

  LyricSearchBloc({LyricService lyricService}) {
    _lyricSearchUseCase = LyricSearchUseCase((viewModel) => lyricSearchViewModelPipe.send(viewModel));

    lyricSearchViewModelPipe.whenListenedDo(() {
      //create scope when requested
      _lyricSearchUseCase.create();
    });
    keywordPipe.receive.listen(keyWordInputHandler);
    submitPipe.listen(submitHandler);
  }

  void keyWordInputHandler(String keywords) {
    _lyricSearchUseCase.updateKeyword(keywords);
  }


  void submitHandler() {
    _lyricSearchUseCase.submit();
  }

  @override
  void dispose() {
    lyricSearchViewModelPipe.dispose();
    keywordPipe.dispose();
    submitPipe.dispose();

  }
}
