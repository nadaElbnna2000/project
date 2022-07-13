import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/screens/LoginScreen.dart';
import 'package:untitled/styles/colors.dart';

class OnBoardingModel
{
   final String image;
   final String title;
   final  String body;

  OnBoardingModel
  (
      this.image,
      this.title,
      this.body
  );
}
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   List<OnBoardingModel> model = [
    OnBoardingModel(
        'assets/images/OnBoarding.png' ,
        'Screen Title 1' ,
        'Screen Body 1'
    ),
    OnBoardingModel(
        'assets/images/OnBoarding.png' ,
        'Screen Title 2' ,
        'Screen Body 2'
    ),
    OnBoardingModel(
        'assets/images/OnBoarding.png' ,
        'Screen Title 3' ,
        'Screen Body 3'
    ),
  ];

  var boardingController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: ()
              {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScrren(),
                    ),
                        (route) => false
                );
              },
              child: Text
                (
                  'SKIP',
                  style: TextStyle(
                   fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),

          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index)
                {
                  if(index == model.length-1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                itemBuilder: (context , index) => buildBoardingItem(model[index]),
                itemCount: model.length,
              ),
            ),
            SizedBox(
                height : 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                controller: boardingController,
                count: model.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: defaultColor,
                  expansionFactor: 4,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 5.0,
                ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast)
                  {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScrren(),
                        ),
                            (route) => false
                    );
                  }
                  else
                  {
                      boardingController.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                  child: const Icon(Icons.arrow_forward_ios,),),
              ],
            ),
          ],
        ),
      )
    );
  }
  Widget buildBoardingItem(OnBoardingModel boarding) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      Expanded(
        child: Image(
          image: AssetImage('${boarding.image}'),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${boarding.title}',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${boarding.body}',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}
