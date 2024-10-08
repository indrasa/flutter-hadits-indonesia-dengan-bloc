import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/hadith_model.dart';
import '/hadith_repository.dart';

part 'hadith_event.dart';
part 'hadith_state.dart';

class HadithBloc extends Bloc<HadithEvent, HadithState> {
  final HadithRepository repository;

  HadithBloc({required this.repository}) : super(HadithInitial()) {
    on<HadithFetched>(_onHadithFetched);
  }

  void _onHadithFetched(HadithFetched event, Emitter<HadithState> emit) async {
    if (state is HadithLoading) return;

    final currentState = state;
    int start = 1;
    List<Hadith> hadiths = [];

    if (currentState is HadithSuccess) {
      hadiths = currentState.hadiths;
      start = hadiths.length + 1;
    }

    try {
      emit(HadithLoading(hadiths: hadiths));
      final newHadiths = await repository.fetchHadiths(start, 20);
      emit(HadithSuccess(hadiths: hadiths + newHadiths));
    } catch (_) {
      emit(HadithFailure());
    }
  }
}
