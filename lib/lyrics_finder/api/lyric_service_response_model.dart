import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class LyricServiceResponseModel extends Equatable implements JsonResponseModel {


  final String lyrics;

  LyricServiceResponseModel.fromJSON(Map<String, dynamic> parsedJson) :
   lyrics=parsedJson['lyrics'];

  @override
  List<Object> get props => [lyrics];
}
