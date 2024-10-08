part of 'hadith_bloc.dart';

abstract class HadithEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HadithFetched extends HadithEvent {}
