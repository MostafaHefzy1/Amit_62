import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio_helper.dart';
import 'package:flutter_application_1/news/business_home_screen.dart';
import 'package:flutter_application_1/news/science_home_screen%20copy.dart';
import 'package:flutter_application_1/news/sports_home_screen.dart';
import 'package:flutter_application_1/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit() : super(LogicInitial());

  static LogicCubit get(context) {
    return BlocProvider.of(context);
  }

  // static LogicCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    SportsNewsHomeScreen(),
    BusinessHomeScreen(),
    const ScienceHomeScreen()
  ];

  int index = 0;
  void changeIndex(int value) {
    index = value;
    emit(EmitChangeIndex());
  }

  NewsModel? businessNewsModel;
  getArticalesBusiness() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "Business",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      businessNewsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }

  NewsModel? newsModel;
  getArticales() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "sports",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }

  NewsModel? scienceNewsModel;
  getSceience() async {
    await DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": "en",
      "q": "science",
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      print("object $value");
      scienceNewsModel = NewsModel.fromJson(value.data);
      emit(NewsArticleSuccessState());
    }).catchError((error) {
      emit(NewsArticleFailedState());
    });
  }
}
