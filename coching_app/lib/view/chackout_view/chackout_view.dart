import 'package:coching_app/constantce.dart';
import 'package:coching_app/data%20provider/course_data_provide.dart';
import 'package:coching_app/model/course.dart';
import 'package:coching_app/utils/route_name.dart';
import 'package:coching_app/utils/util.dart';
import 'package:coching_app/view/chackout_view/widget/payment_method.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChackoutView extends StatelessWidget {
  const ChackoutView({super.key, required this.courses, required this.totelprice});
  final List<Course> courses;
  final double totelprice;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CourseDataProvide>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chackout'),
      ),
      body:Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[ 
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Billing Address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),),
            const SizedBox(height: 10,),
            CSCPicker(
              layout: Layout.vertical,
              flagState: CountryFlag.DISABLE,
              onCountryChanged:(value) {},
              onStateChanged: (value) {},
              onCityChanged: (value){},
            ),
            const SizedBox(height: 10,),
            const Text('Payment Method',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),),
            const SizedBox(height: 10,),
             PaymentMethod(),
            const SizedBox(height: 10,),
             const Text('Order',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context,index){
                  Course course = courses[index];
                  return ListTile(
                    leading: Image.network(course.thumbnaiul,width: 50,height: 50,),
                    title: Text(course.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight:FontWeight.bold,
                        ),),
                    trailing: Text("\$${course.price}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight:FontWeight.bold,
                        ),),
                  );
                }))
          ],
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$$totelprice',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),

                Card(
                  elevation: 4,
                  child: GestureDetector(
                    onTap: () {
                      provider.addInMyList(courses);
                      provider.clearCart();
                      Util.showMessage(context, 'Your Order Is Placed Sussessfully');
                      Navigator.pushNamed(context, RouteName.home);
                    },
                    child: Container(
                      height: 42,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: kBlueColor
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Place Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        ),
    );
  }
}