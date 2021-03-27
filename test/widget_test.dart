import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_feature_widget.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_presenter.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_screen.dart';
import 'package:task_acme/routes.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
Widget tester =MediaQuery(
  data: new MediaQueryData(),
  child: CFRouterScope(
    routeGenerator: LyricFinderRouter.generate,
    initialRoute: LyricFinderRouter.initialRoute,
    builder: (context) => MaterialApp.router(
      routeInformationParser: CFRouteInformationParser(),
      routerDelegate: CFRouterDelegate(context),
      debugShowCheckedModeBanner: false,

)));
  testWidgets('Lyric Finder App', (WidgetTester widgetTester)async{
    await widgetTester.pumpWidget(tester);
    expect(find.byType(LyricsFeatureWidget), findsOneWidget);
    expect(find.byType(LyricsFinderPresenter), findsOneWidget);
    expect(find.byType(LyricSearchScreen), findsNothing);

  });





}