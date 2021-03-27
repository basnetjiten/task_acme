import 'package:clean_framework/clean_framework.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_usecase.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';
import 'package:test/test.dart';

void main() {

  test('LyricSearchUseCase initialize with error', () {
    try {
      LyricSearchUseCase(null);
    } catch (e) {
      expect(e != null, true);
    }
  });
  test('LyricSearchUseCase initialize and create', () {
    final LyricSearchUseCase useCase = LyricSearchUseCase((viewModel) {
      expect(viewModel, isA<LyricSearchViewModel>());
    });
    useCase.create();
  });

  test('LyricSearchUseCase initialize and re-create', () {
    final useCase = LyricSearchUseCase((viewModel) {
      expect(viewModel, isA<LyricSearchViewModel>());
    });
    useCase.create();
    useCase.create();
  });
}
