import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:opentrivia/data/app_color.dart';
import 'package:opentrivia/data/image.dart';
import 'package:opentrivia/models/category.dart';
import 'package:opentrivia/models/question.dart';
import 'package:opentrivia/ui/widgets/quiz_options.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/ui/pages/quiz_finished.dart';

class HomePage extends StatelessWidget {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  final Color blueColor = Colors.lightBlue;

  final List<Question> questions;
  final Map<int, dynamic> answers;

  final Category category;
  final Type type;

  int correctAnswers;
  HomePage({Key key, @required this.questions, @required this.answers, this.category, this.type}): super(key: key);



  // final AnimationController controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  //
  // final Animation<Offset> animation = Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.08)).animate(controller);

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text('',style: TextStyle(color: Colors.white),),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration:
                    BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image_background2.png"),
                          fit: BoxFit.fill),
                    ),
                // height: 200,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 26.0, vertical: 8.0),
                //     child: Text(
                //       "Select a category to start the quiz",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.0),
                //     ),
                //   ),
                // ),
                SliverPadding(
                  padding: const EdgeInsets.all(120.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width >
                                  1000
                              ? 7
                              : MediaQuery.of(context).size.width > 500 ? 5 : 1,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 30.0),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: categories.length,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    int correct = 0;
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );

    return MaterialButton(
      onPressed: () => _categoryPressed(context, category),
      // width: 150,
      // height: 150,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
      color: Colors.lightBlue,
        textColor: Colors.white70,
      // decoration:
      //   BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/image_button.png"),
      //       fit: BoxFit.fitWidth,
      //     ),
      //     // shape: BoxShape.circle,
      //   ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (category.icon != null) Icon(category.icon, color: AppColors.white),
              if (category.icon != null) SizedBox(height: 5.0),
              // Text("${category.name}" ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black,),),
              AutoSizeText(
                category.name,
                minFontSize: 10.0,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 3,
                wrapWords: false,
              ),

              // ListTile(
              //   contentPadding: const EdgeInsets.all(16.0),
              //   trailing: Text("${questions.length - correct}/${questions.length}", style: trailingStyle),
              // ),
            ],
      ),
    );
    // return MaterialButton(
    //
    //   elevation: 1.0,
    //   highlightElevation: 1.0,
    //   onPressed: () => _categoryPressed(context, category),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(80.0),
    //   ),
    //   color: Colors.lightBlue,
    //   // textColor: Colors.white70,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       if (category.icon != null) Icon(category.icon, color: AppColors.white,),
    //       if (category.icon != null) SizedBox(height: 5.0),
    //       AutoSizeText(
    //         category.name,
    //         minFontSize: 10.0,
    //         textAlign: TextAlign.center,
    //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    //         maxLines: 3,
    //         wrapWords: false,
    //       ),
    //       // ListTile(
    //       //   contentPadding: const EdgeInsets.all(16.0),
    //       //   trailing: Text("${questions.length - correct}/${questions.length}", style: trailingStyle),
    //       // ),
    //     ],
    //   ),
    // );

  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
