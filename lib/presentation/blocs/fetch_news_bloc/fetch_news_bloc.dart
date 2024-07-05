import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/data/models/data_model.dart';
import 'package:news_app/data/repositories/data_sources/remote_data_source.dart';

part 'fetch_news_event.dart';
part 'fetch_news_state.dart';

class FetchNewsBloc extends Bloc<FetchNewsEvent, FetchNewsState> {
  FetchNewsBloc() : super(FetchNewsInitial()) {
    on<NewsInitialFetchEvent>(newsInitialFetchEvent);
  }

  FutureOr<void> newsInitialFetchEvent(
      NewsInitialFetchEvent event, Emitter<FetchNewsState> emit) async {
    emit(FetchNewsLoadingState());
    try {
      final Response result = await NewsRepo.fetchNews();
      final responseBody = jsonDecode(result.body);
      if (result.statusCode == 200) {
        DataModel dataModel = DataModel.fromJson(responseBody);
        emit(FetchNewsSuccesfulState(dataModel: dataModel));
      } else if (result.statusCode >= 400 && result.statusCode < 500) {
        emit(FetchNewsFailureState(error: 'Clint side Error'));
      } else if (result.statusCode >= 500 && result.statusCode < 600) {
        emit(FetchNewsFailureState(error: 'Server side Error'));
      }
    } catch (error) {
      emit(FetchNewsFailureState(error: error.toString()));
    }
  }
}
