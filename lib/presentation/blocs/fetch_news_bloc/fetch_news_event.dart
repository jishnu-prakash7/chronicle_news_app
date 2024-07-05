part of 'fetch_news_bloc.dart';

@immutable
sealed class FetchNewsEvent {}

class NewsInitialFetchEvent extends FetchNewsEvent {}
