import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/config/constants/app_color.dart';
import 'package:news_app/config/utils/space.dart';
import 'package:news_app/data/models/data_model.dart';
import 'package:news_app/presentation/views/web_view_page/web_view_page.dart';

InkWell slider(BuildContext context, Article article) {
  return InkWell(
    onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailsPage(url: article.url))),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(article.urlToImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.25),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        constraints:
                            const BoxConstraints(minWidth: 30, maxWidth: 80),
                        child: Text(
                          maxLines: 1,
                          article.author ?? 'Unknown',
                          style: const TextStyle(color: kWhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      width5(),
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: kWhite,
                      ),
                      width5(),
                      Text(
                        DateFormat.yMMMd().format(article.publishedAt),
                        style: const TextStyle(color: kWhite),
                      ),
                    ],
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    article.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: kWhite),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
