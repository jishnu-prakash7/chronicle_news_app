import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/models/data_model.dart';
import 'package:news_app/presentation/views/web_view_page/web_view_page.dart';

InkWell listContainerSection(BuildContext context, Article article) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailsPage(
          url: article.url,
        ),
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    fadeInDuration: const Duration(milliseconds: 200),
                    image: article.urlToImage!,
                    placeholder: 'assets/images/news-placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 70),
                            child: Text(
                              maxLines: 1,
                              article.author ?? 'Unknown',
                              overflow: TextOverflow.fade,
                            )),
                        Text(DateFormat.yMMMd().format(article.publishedAt)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
