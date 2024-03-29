import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/programs_model.dart';

class ShowAll extends StatefulWidget {
  String? query;

  ShowAll({required this.query, super.key});

  @override
  State<ShowAll> createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  bool isLoading = true;

  //Programs list
  List<ProgramsQueryModel> programModelList = [];

  //function
  Future<void> getPrograms(String query) async {
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    data["items"].forEach((element) {
      try {
        ProgramsQueryModel programModel = ProgramsQueryModel();
        programModel = ProgramsQueryModel.fromMap(element);
        programModelList.add(programModel);
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
    getPrograms(widget.query.toString());
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
                    itemCount: programModelList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            //code here
                          },
                          child: Container(
                            height: 350,
                            margin: const EdgeInsets.all(15),
                            child: Material(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20)),
                              elevation: 10,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      "assets/images/program.jpg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 200,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    left: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          programModelList[index]
                                              .programCategory,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          programModelList[index]
                                              .programName,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "${programModelList[index].programLesson} lessons",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
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
