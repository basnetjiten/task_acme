import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_bloc.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_feature_widget.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_presenter.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_screen.dart';

void main() {
  testWidgets('Lyric Search Widget Test', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<LyricSearchBloc>(
            create: (_) => LyricSearchBloc(), child: LyricsFeatureWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 1000));
    await tester.enterText(find.byType(TextFormField), 'HELLO');
    /*final SearchContainerState myWidgetState = tester.state(find.byType(SearchContainer));
    myWidgetState.setState(() {
      myWidgetState.folded=true;
    });*/
    expect(find.byType(LyricsFinderPresenter), findsOneWidget);
    expect(find.byType(LyricSearchScreen), findsOneWidget);
    expect(find.byType(SearchContainer),findsOneWidget);
    expect(find.widgetWithText(TextFormField,'HELLO'),findsOneWidget);
    //final childFinder = find.descendant(of: find.byType(SearchContainer), matching: find.byType(TextFormField));
    //expect(childFinder, findsOneWidget);
   // expect(find.byKey(ValueKey("lyric_key")),findsOneWidget);
   // await tester.enterText(find.byType(TextFormField), 'HELLO');




    
    
  });
}




