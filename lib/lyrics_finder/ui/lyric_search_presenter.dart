
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:task_acme/lyrics_finder/bloc/lyric_bloc.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';
import 'package:task_acme/lyrics_finder/ui/lyric_search_screen.dart';

class LyricsFinderPresenter extends Presenter<LyricSearchBloc, LyricSearchViewModel, LyricSearchScreen> {
  @override
  LyricSearchScreen buildScreen(
      BuildContext context, LyricSearchBloc bloc, LyricSearchViewModel viewModel) {

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == LyricServiceStatus.initial) {
        print('init');

      }
      print(viewModel.serviceStatus.toString());
      if (viewModel.serviceStatus == LyricServiceStatus.success) {
        if(viewModel.lyrics!='initial lyrics'){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LyricsResult(viewModel: viewModel,)));

        }
        return;
      } else if (viewModel.serviceStatus == LyricServiceStatus.fail) {
       // _showErrorDialog(context);
      } else if (viewModel.serviceStatus == LyricServiceStatus.unknown) {
        //_showInvalidDataDialog(context);
      }
    });
    return LyricSearchScreen(
      viewModel: viewModel,
      onSearchInputChange: (searchKeyWords) {
        debugPrint("SEARCH INPUT KEY WORDS"+searchKeyWords);
        _onChangeKeyword(bloc, searchKeyWords);
      },
      // Make login button route to CashAccounts screen, implement login later
      onTapSubmit: (value) {
        bloc.keywordPipe.send(value);
        bloc.submitPipe.launch();
    }

    );
  }

  void _onChangeKeyword(LyricSearchBloc bloc, String searchKeyWord) {

  }



  // Add back in when login is added
  // void _onTapSubmit(LoginBloc bloc) {
  //   bloc.submitPipe.launch();
  // }

  @override
  Stream<LyricSearchViewModel> getViewModelStream(LyricSearchBloc bloc) {
    return bloc.lyricSearchViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }



}

class LyricsResult extends StatelessWidget {
  final LyricSearchViewModel viewModel;
  LyricsResult({this.viewModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(viewModel.keyword,style: TextStyle(color: Colors.black54),),
       leading: IconButton(onPressed:(){
         Navigator.of(context).pop();
       },icon:Icon(CupertinoIcons.back,color: Colors.black54,)),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:ListView(
            children: [
              SizedBox(height: 10,),
              Center(child: Text(viewModel.lyrics,style: TextStyle(fontSize:20,fontWeight: FontWeight.w400),))
            ],
          ),
        ),
      ),
    );
  }
}

