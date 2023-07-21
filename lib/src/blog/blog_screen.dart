import 'package:flutter/material.dart';
import 'package:crop_insurance_assistance/constants/constants.dart';
import 'package:crop_insurance_assistance/src/widgets/big_text.dart';
import 'package:crop_insurance_assistance/src/widgets/small_text.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';

import '../../constants/dimensions.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            BlogCategory(
              title: 'Farming Tips',
              articles: [
                BlogArticle(
                  title: 'Best Practices for Crop Rotation',
                  description:
                      'Learn how crop rotation can improve soil health and crop yield.',
                  imageUrl: 'assets/images/crop_rotation.jpg',
                ),
                BlogArticle(
                  title: 'Water Conservation Techniques',
                  description:
                      'Discover effective water conservation techniques for sustainable farming.',
                  imageUrl: 'assets/images/water_conservation.jpg',
                ),
                BlogArticle(
                  title: 'Integrated Pest Management',
                  description:
                      'Implement integrated pest management strategies to protect your crops naturally.',
                  imageUrl: 'assets/images/pest_management.jpg',
                ),
              ],
            ),
            verticalSpacing(20),
            BlogCategory(
              title: 'Insurance Claims',
              articles: [
                BlogArticle(
                  title: 'Steps to File an Insurance Claim',
                  description:
                      'Learn about the process of filing an insurance claim for crop damage.',
                  imageUrl: 'assets/images/insurance_claim.jpg',
                ),
                BlogArticle(
                  title: 'Understanding Insurance Coverage',
                  description:
                      'Gain insights into the different types of insurance coverage for farmers.',
                  imageUrl: 'assets/images/insurance_coverage.jpg',
                ),
              ],
            ),
            verticalSpacing(20),
            BlogCategory(
              title: 'Latest News',
              articles: [
                BlogArticle(
                  title: 'New Technologies in Agriculture',
                  description:
                      'Explore the latest technological advancements revolutionizing the farming industry.',
                  imageUrl: 'assets/images/agriculture_technology.jpg',
                ),
                BlogArticle(
                  title: 'Market Trends for Agricultural Products',
                  description:
                      'Stay informed about the current market trends and demand for agricultural products.',
                  imageUrl: 'assets/images/market_trends.jpg',
                ),
                BlogArticle(
                  title: 'Climate Change and Agriculture',
                  description:
                      'Understand the impact of climate change on agriculture and adaptive strategies.',
                  imageUrl: 'assets/images/climate_change.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCategory extends StatelessWidget {
  final String title;
  final List<BlogArticle> articles;

  const BlogCategory({
    required this.title,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: title,
          color: Colors.green[700],
        ),
        verticalSpacing(10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: articles.map((article) {
              return Container(
                width: 180,
                child: BlogCard(
                  article: article,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  final BlogArticle article;

  const BlogCard({
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              article.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: article.title,
                  color: Colors.black87,
                  size: Dimensions.font16,
                  fontWeight: FontWeight.bold,
                ),
                verticalSpacing(10),
                SmallText(
                  text: article.description,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlogArticle {
  final String title;
  final String description;
  final String imageUrl;

  const BlogArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
