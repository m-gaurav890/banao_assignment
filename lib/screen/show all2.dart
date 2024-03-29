import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/lessons_model.dart';

class ShowAll2 extends StatefulWidget {
  String? query;
  ShowAll2({required this.query, super.key});

  @override
  State<ShowAll2> createState() => _ShowAll2State();
}

class _ShowAll2State extends State<ShowAll2> {
  bool isLoading = true;

  //Programs list
  List<LessonsQueryModel> lessonModelList = [];

  //function
  Future<void> getLessons(String query) async {
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    data["items"].forEach((element) {
      try {
        LessonsQueryModel lessonModel = LessonsQueryModel();
        lessonModel = LessonsQueryModel.fromMap(element);
        lessonModelList.add(lessonModel);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void initState() {
    getLessons(widget.query.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query.toString()),
        centerTitle: true,
      ),
      body: isLoading
          ? Container(
              height: MediaQuery.of(context).size.height - 400,
              child: const Center(child: CircularProgressIndicator()),
            )
          : Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: lessonModelList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          //code here
                        },
                        child: Container(
                          height: 350,
                          margin: EdgeInsets.all(15),
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/lesson.jpg",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lessonModelList[index].lessonCategory,
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width - 70, // Adjust the width as needed
                                        child: Text(
                                          lessonModelList[index].lessonName,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${lessonModelList[index].lessonDuration} min",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 270,
                                          ),
                                          const Icon(Icons.lock)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
