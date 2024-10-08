part of 'hadith_bloc.dart';

abstract class HadithState extends Equatable {
  const HadithState();

  @override
  List<Object> get props => [];
}

class HadithInitial extends HadithState {}

class HadithLoading extends HadithState {
  final List<Hadith> hadiths;
  const HadithLoading({required this.hadiths});

  @override
  List<Object> get props => [hadiths];
}

class HadithSuccess extends HadithState {
  final List<Hadith> hadiths;
  const HadithSuccess({required this.hadiths});

  @override
  List<Object> get props => [hadiths];
}

class HadithFailure extends HadithState {}
