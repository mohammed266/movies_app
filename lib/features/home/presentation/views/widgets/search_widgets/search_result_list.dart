import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../data/model/search/search_model.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.searchList});
  final List<SearchModel> searchList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          var result = searchList[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 300.h,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: buildBoxDecoration(),
              child: Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 150.w,
                      height: 300.h,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${result.posterPath}',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //media type
                        Text(
                          result.mediaType,
                          style: Styles.textStyle20,
                        ),
                        Row(
                          children: [
                            //vote average box
                            customContainer(
                              '${result.voteAverage}',
                              Icons.star,
                            ),
                            SizedBox(width: 10.w),
                            //popularity
                            customContainer(
                              '${result.popularity}',
                              Icons.people_outline_sharp,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            result.overview,
                            textAlign: TextAlign.left,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      color: Color.fromRGBO(20, 20, 20, 1),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }

  Container customContainer(String result, IconData? icon) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.amber,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(result),
          ],
        ),
      ),
    );
  }
}
