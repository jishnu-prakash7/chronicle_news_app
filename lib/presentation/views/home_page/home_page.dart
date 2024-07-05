import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/config/constants/app_color.dart';
import 'package:news_app/data/models/data_model.dart';
import 'package:news_app/presentation/blocs/fetch_news_bloc/fetch_news_bloc.dart';
import 'package:news_app/presentation/views/home_page/widgets/app_title.dart';
import 'package:news_app/presentation/views/home_page/widgets/error_dialog.dart';
import 'package:news_app/presentation/views/home_page/widgets/list_container_section.dart';
import 'package:news_app/presentation/views/home_page/widgets/slider.dart';
import 'package:news_app/presentation/views/home_page/widgets/heading_text.dart';
import 'package:news_app/presentation/views/home_page/widgets/slider_dot_indicators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  void initState() {
    context.read<FetchNewsBloc>().add(NewsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 1,
        shadowColor: Colors.black,
        title: appTitle(),
      ),
      body: CustomMaterialIndicator(
        indicatorBuilder: (context, controller) {
          return LoadingAnimationWidget.inkDrop(
            color: kBlack,
            size: 30,
          );
        },
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          context.read<FetchNewsBloc>().add(NewsInitialFetchEvent());
        },
        child: BlocConsumer<FetchNewsBloc, FetchNewsState>(
          listener: (context, state) {
            if (state is FetchNewsFailureState) {
              errorDialog(context, state);
            }
          },
          builder: (context, state) {
            if (state is FetchNewsLoadingState) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: kBlack,
                  size: 50,
                ),
              );
            } else if (state is FetchNewsSuccesfulState) {
              List<Article> articles = state.dataModel.articles;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingText(heading: 'Breaking News!'),
                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex) {
                        final Article article = articles[index];
                        return slider(context, article);
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                    sliderDotIndicators(currentIndex: currentIndex),
                    headingText(heading: 'Top Highlights!'),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          Article article = articles[index];
                          return listContainerSection(context, article);
                        }),
                  ],
                ),
              );
            } else if (state is FetchNewsFailureState) {
              return Center(
                child: Text('Failed to load news: ${state.error}'),
              );
            } else {
              return const Center(child: Text('No Data Found'));
            }
          },
        ),
      ),
    );
  }
}
