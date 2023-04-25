import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/entity/Onboard.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(child:
                PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context,index) => OnboardingContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
                ),
                Row(
                  children: [
                    ...List.generate(demo_data.length, (index) => Padding(
                      padding: const EdgeInsets.only(right:4.0),
                      child: DotIndicator(isActive: index == _pageIndex,),
                    )),
                    const Spacer(),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        child: Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ?  Colors.blue : Colors.blue.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}
final List<Onboard> demo_data = [
  Onboard(image: "images/cooking.jpg", title: "Explore Various Food Recipes",description: "Explore and find various food recipes from the ingredients that you have"),
  Onboard(image: "images/materials.jpg", title: "Plan Your Diet",description: "Find recipes suitable for you by adding complex medical criteria"),
  Onboard(image: "images/eating.jpg", title: "Try Making Your Own Food Now",description: "Dont wait too long! Let's try make your own food now")

];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key, required this.image, required this.title,required this.description
  }) : super(key: key);
  final String image,title,description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset(image,height: 300,)),
        const Spacer(),
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10,),
        Text(description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
        ),
        const Spacer(),
      ],
    );
  }
}
