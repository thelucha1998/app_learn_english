import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opentrivia/ui/pages/home.dart';
import '/data/app_color.dart';
import '/data/image.dart';
import '/models/category.dart';
import '/models/question.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '/ui/pages/quiz_finished.dart';
import 'package:html_unescape/html_unescape.dart';

import 'container_color.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final Category category;
  final Type type;

  const QuizPage({Key key, @required this.questions, this.category, this.type})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white,);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final _controller  = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    // final List<dynamic> options = question.answers;

    // if (!options.contains(question.correctAnswer)) {
    //   options.add(question.correctAnswer);
    //   options.shuffle();
    // }
    // options.shuffle();

    var controller;
    var width;
    bool _hasBeenPressed = false;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        // appBar: AppBar(
        //   title: Text(
        //     widget.category.name,
        //     style: TextStyle(
        //         color: Colors.white
        //     ),
        //   ),
        //   elevation: 0,
        // ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                // decoration:
                //     BoxDecoration(color: Theme.of(context).primaryColor),
                // height: 200,
                decoration:
                BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image_background2.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            IconButton(onPressed: _backButton, icon: new Icon(Icons.arrow_back_ios), color: Colors.white,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              // controller: _controller
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // SizedBox(width: 150),
                      Image.asset(
                        //   controller.correctAnswer == 9 ||
                        //       controller.correctAnswer == 10
                        //       ? Images.image_star_yelow
                        //       :
                        Images.image_star_gray,
                        width: 30,
                        height: 30,
                      ),
                      Image.asset(
                        //   controller.correctAnswer == 9 ||
                        //       controller.correctAnswer == 10
                        //       ? Images.image_star_yelow
                        //       :
                        Images.image_star_gray,
                        width: 30,
                        height: 30,
                      ),
                      Image.asset(
                        //   controller.correctAnswer == 9 ||
                        //       controller.correctAnswer == 10
                        //       ? Images.image_star_yelow
                        //       :
                        Images.image_star_gray,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),

                  // Container(
                  //   padding: const EdgeInsets.only(left: 10, right: 10),
                  //   constraints: BoxConstraints(minWidth: 0, maxWidth: width - 20),
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.blue5,
                  //       borderRadius: BorderRadius.all(Radius.circular(7))),
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: controller.color.length,
                  //       itemBuilder: (context, index) {
                  //         return ContainerColor(
                  //           // ignore: invalid_use_of_protected_member
                  //           colors: controller.color[index].value == "true"
                  //               ? AppColors.green : controller.color[index].value == "fail"
                  //               ? AppColors.red1 : AppColors.gray4,
                  //         );
                  //       }),
                  // ),
                  SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 30.0,
                    child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: new List.generate(10, (int index) {
                      return new Card(
                        // color: Colors.blue[index * 100],
                        color: Colors.grey[index * 100],
                        child: new Container(
                          width: 25.0,
                          height: 25.0,
                          // child: new Text("$index"),
                        ),
                      );
                    }),
                  ),
                  ),

                  // SizedBox(height: 150),
                  SizedBox(height: 40.0),

                  Center(
                    child: Image.asset(
                      Images.image_turtle,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 60.0),
                  Row(
                    children: <Widget>[

                      // CircleAvatar(
                      //   backgroundColor: Colors.white70,
                      //   child: Text("${_currentIndex + 1}"),
                      // ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          HtmlUnescape().convert(
                              widget.questions[_currentIndex].question,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: MediaQuery.of(context).size.width > 800
                              ? _questionStyle.copyWith(fontSize: 20.0)
                              : _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 120.0),

                    // child: Column(
                    //   // mainAxisSize: MainAxisSize.min,
                    //   children: <Widget>[
                    //     ...options.map((option) => RadioListTile(
                    //
                    //           title: Text(HtmlUnescape().convert("$option"),style: MediaQuery.of(context).size.width > 800
                    //           ? TextStyle(
                    //             fontSize: 30.0
                    //           ) : null,),
                    //           groupValue: _answers[_currentIndex],
                    //           value: option,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _answers[_currentIndex] = option;
                    //             });
                    //           },
                    //         )),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // RaisedButton(
                        //     color: _hasBeenPressed ? Colors.blue : Colors.green,
                        //     onPressed: () =>
                        //         setState(() {
                        //           _hasBeenPressed = !_hasBeenPressed;
                        //         }
                        //     )
                        // ),
                        InkWell(
                          onTap: _nextSubmit,
                          // onLongPress: _nextSubmit,
                          // onTap: onPressOne,
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppColors.black),
                              color: AppColors.white,
                              // color: _isCorrectAnswer()
                              //   ? AppColors.blue5
                              //   : AppColors.red1
                            ),
                            child: Center(
                              child: InkWell(

                                child: Text(
                                  _currentIndex == (widget.questions.length - 1)
                                      ? "Submit"
                                      :"${widget.questions[_currentIndex].answers[0]}" ?? "" ,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, "write your route");
                                },
                              ),
                              // child: Text(
                              //   HtmlUnescape().convert(
                              //     widget.questions[_currentIndex].question,
                              //     // _answers[_currentIndex]
                              //     // _answers[_currentIndex],
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: _nextSubmit,
                          // onLongPress: () => setState(() {
                          //   _hasBeenPressed = !_hasBeenPressed;
                          // }),
                          // onTap: onPressTwo,
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppColors.black),
                              color: AppColors.white,
                              // color: _isCorrectAnswer()
                              //     ? AppColors.blue5
                              //     : AppColors.red1

                              // color: controller.color[_isCorrectAnswer()].value == "true"
                              //     ? AppColors.green : controller.color[_isCorrectAnswer()].value == "false"
                              //     ? AppColors.red1 : AppColors.gray4,
                            ),
                            child: Center(
                              child: Text(
                                _currentIndex == (widget.questions.length - 1)
                                    ? "Submit"
                                    : "${widget.questions[_currentIndex].answers[1]}" ?? "",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  // Expanded(
                  //   child: Container(
                  //     alignment: Alignment.bottomCenter,
                  //     child: RaisedButton(
                  //       padding: MediaQuery.of(context).size.width > 800
                  //             ? const EdgeInsets.symmetric(vertical: 20.0,horizontal: 64.0) : null,
                  //       child: Text(
                  //           // _currentIndex == (widget.questions.length - 1)
                  //           //     ? "Submit"
                  //               "Nộp bài"
                  //             ),
                  //             //   : "Tiếp", style: MediaQuery.of(context).size.width > 800
                  //             // ? TextStyle(fontSize: 30.0) : null,),
                  //       onPressed: _nextSubmit,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    // if (_answers[_currentIndex] == null) {
    //   _key.currentState.showSnackBar(SnackBar(
    //     content: Text("You must select an answer to continue."),
    //   ));
    //   return;
    // }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    }
    else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
              questions: widget.questions, answers: _answers)));
    }

    // bool _hasCorrectAnswer(){
    //   for(int i=0; i<2; i++){
    //     if(widget.questions[_currentIndex].answers[i] == widget.questions[_currentIndex].correctAnswer){
    //       return true;
    //     }
    //     else{
    //       return false;
    //     }
    //   }
    //
    // }
  }

  bool _isCorrectAnswer(){
    for(int i=0; i<2; i++){
      if("widget.questions[_currentIndex].answers[i]" == "widget.questions[_currentIndex].correctAnswer"){
        return true;
      }
      else{
        return false;
      }
    }

  }

  void _backButton(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomePage(questions: widget.questions, answers: _answers)
        )
    );
  }

  //
  // Color checkColors(String status) {
  //   if (status == "true") {
  //     return AppColors.green;
  //   }
  //
  //   if (status == "false") {
  //     return AppColors.red1;
  //   }
  //
  //   return AppColors.green1;
  // }

  // void _nextQuestion(){
  //   Widget build(BuildContext context){
  //     return Container(
  //
  //     );
  //   }
  // }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Bạn có muốn kết thúc bài test? Tất cả các câu trả lời sẽ không được ghi nhận"),
            title: Text("Cảnh báo!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
