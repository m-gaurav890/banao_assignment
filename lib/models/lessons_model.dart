class LessonsQueryModel {
  String lessonName;
  String lessonCategory;
  String lessonDuration;
  bool? isLocked;

  LessonsQueryModel(
      {this.lessonName = "lessonName",
      this.lessonCategory = "lessonCategory",
      this.lessonDuration = "lessonDuration",
      this.isLocked});

  factory LessonsQueryModel.fromMap(Map lessons) {
    return LessonsQueryModel(
        lessonName: lessons["name"],
        lessonCategory: lessons["category"],
        lessonDuration: lessons["duration"].toString(),
        isLocked: lessons["locked"]);
  }
}
