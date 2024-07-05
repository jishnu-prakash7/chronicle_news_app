part of 'fetch_news_bloc.dart';

@immutable
sealed class FetchNewsState {}

final class FetchNewsInitial extends FetchNewsState {}

final class FetchNewsLoadingState extends FetchNewsState {}

final class FetchNewsSuccesfulState extends FetchNewsState {
  final DataModel dataModel;

  FetchNewsSuccesfulState({required this.dataModel});
}

final class FetchNewsFailureState extends FetchNewsState {
  final String error;

  FetchNewsFailureState({required this.error});
}
