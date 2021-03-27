import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:task_acme/lyrics_finder/model/lyric_view_model.dart';

class LyricSearchScreen extends Screen {
  final LyricSearchViewModel viewModel;
  final Function onSearchInputChange;
  final Function onTapSubmit;

  LyricSearchScreen({
    this.onSearchInputChange,
    this.onTapSubmit,
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SearchContainer(
        viewModel: viewModel,
        onTapSubmit:onTapSubmit,
        onSearchInputChange: onSearchInputChange,
      ),
    );
  }
}

class SearchContainer extends StatefulWidget {
  final Function onSearchInputChange;
  final Function onTapSubmit;
  final LyricSearchViewModel viewModel;

  const SearchContainer({this.viewModel,this.onTapSubmit,this.onSearchInputChange});

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/3,),
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: _folded ? 56 : 200,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: kElevationToShadow[6],
              ),
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: !_folded
                        ? _textFormField(Key('lyric_key'), 'Search lyrics',
                            widget.onTapSubmit,
                            widget.onSearchInputChange, TextInputType.text)
/*TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.blue[300]),
                          border: InputBorder.none),
                    )*/
                        : null,
                  ),
                ),
                Container(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_folded ? 32 : 0),
                        topRight: Radius.circular(32),
                        bottomLeft: Radius.circular(_folded ? 32 : 0),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          _folded ? Icons.search : Icons.close,
                          color: Colors.blue[900],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _folded = !_folded;
                        });
                      },
                    ),
                  ),
                ),
              ])),
          SizedBox(height: 20,),
          showSearchProgress(widget.viewModel.serviceStatus)

        ],
      ),
    );
  }

  Widget _textFormField(Key key, String hintText, Function onTapSubmit,Function onChangeTextField,
      TextInputType textInputType) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText:hintText,
          hintStyle: TextStyle(color: Colors.blue[300]),
          border: InputBorder.none),
      onChanged: (value) {
        onChangeTextField(value);
      },
      onFieldSubmitted:(value){
        onTapSubmit(value);
      },
    );
  }

  Widget showSearchProgress(serviceStatus){
    switch(serviceStatus){
      case LyricServiceStatus.processing:
       return Center(child: CircularProgressIndicator(),);
        break;
      case LyricServiceStatus.fail:
        return Text("oops!!  lyrics not found");
        break;
      default:
        return SizedBox();


    }

  }
}
