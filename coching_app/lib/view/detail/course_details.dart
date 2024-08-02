import 'package:coching_app/constantce.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/utils/util.dart';
import 'package:coching_app/view/detail/widget/favorite_widget.dart';

class CourseDetails extends StatelessWidget {
  final Course course;
  CourseDetails({Key? key, required this.course}) : super(key: key);

  static TextStyle greyTextStyle = TextStyle(color: Colors.grey.shade600, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CourseDataProvide>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 10),
                    _buildCourseImage(),
                    const SizedBox(height: 10),
                    _buildCourseDetails(context, provider),
                  ],
                ),
              ),
            ),
            _buildActionButtons(context, provider),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.grey.shade800,
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.grey.shade800,
                onPressed: () => Navigator.pushNamed(context, '/shoppingCartScreen'),
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.grey.shade800,
                onPressed: () {}, // Implement share functionality
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(course.thumbnaiul),
        ),
        Column(
          children: [
            Icon(Icons.play_arrow, size: 30, color: Colors.grey.shade500),
            const SizedBox(height: 10),
            Text(
              'Play video',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCourseDetails(BuildContext context, CourseDataProvide provider) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 10),
          _buildCourseMeta(),
          const SizedBox(height: 10),
          ReadMoreText(
            course.discription,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: greyTextStyle,
            moreStyle: const TextStyle(
              color: kBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            lessStyle: const TextStyle(
              color: kBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          _buildCourseContentHeader(),
          const SizedBox(height: 10),
          _buildCourseContentList(),
        ],
      ),
    );
  }

  Widget _buildCourseMeta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.person, color: kBlueColor),
            const SizedBox(width: 10),
            Text(
              course.createdBy,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kBlueColor,
              ),
            ),
          ],
        ),
        FavoriteWidget(course: course),
      ],
    );
  }

  Widget _buildCourseContentHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Course Content',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '(${course.section.length})',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseContentList() {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: course.section.length,
        itemBuilder: (context, index) {
          return _buildCourseContent(index);
        },
      ),
    );
  }

  Widget _buildCourseContent(int index) {
    final section = course.section[index];
    return ExpansionTile(
      title: Text(
        'Section ${index + 1} - ${section.name}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: section.lecture.map((lecture) {
        return ListTile(
          dense: true,
          onTap: () {},
          leading: const SizedBox(),
          title: Text(course.title),
          subtitle: Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 10),
              Text(
                lecture.Duration,
                style: greyTextStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons(BuildContext context, CourseDataProvide provider) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${course.price} PRK',
                style: TextStyle(color: Colors.grey.shade900),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kBlueColor),
                    onPressed: () {
                      final message = provider.shoppingCartCourseList.contains(course)
                          ? 'Course is already added to your cart'
                          : 'Course added to your cart';

                      provider.addCourse(course);
                      Util.showMessageWithAction(
                        context,
                        message,
                        'View',
                        () => Util.openShoppingCart(context),
                      );
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kBlueColor),
                    onPressed: () {},
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
