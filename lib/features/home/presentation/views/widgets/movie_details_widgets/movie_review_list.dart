import 'package:flutter/material.dart';

import '../../../../../../core/resources/styles.dart';

class MovieReviewList extends StatelessWidget {
  const MovieReviewList({super.key, required this.reviewList});
  final List reviewList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          // Check if the review list is empty before accessing the element
          if (reviewList[index].reviews.isEmpty) {
            return const SizedBox();
          }
          var review = reviewList[index].reviews[0];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  review.authorDetails.avatarPath!.isEmpty
                                      ? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
                                      : "https://image.tmdb.org/t/p/w500${review.authorDetails.avatarPath}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.authorDetails.username,
                                style: Styles.textStyle16,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                review.createdAt,
                                style: Styles.textStyle12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            review.authorDetails.rating.toString(),
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(review.content),
              ],
            ),
          );
        },
      ),
    );
  }
}
