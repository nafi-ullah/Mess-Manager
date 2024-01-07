enum MealMenu {
  Off,
  Chicken,
  Fish,
  Rice
}
enum MealTime{
  Lunch,
  Dinner
}


class MembersMeal{
  const MembersMeal({
    required this.userId,
    required this.memberName,
    required this.myMealActivity,
    required this.mealCount,
    required this.mealTime,
    required this.date,
    required this.personalMsg,

    // required this.totalChickenCount,
    // required this.totalFishCount,
    // required this.totalStarCount,
  });

  final String userId;
  final String memberName;
  final mealMenu myMealActivity;
  final int mealCount;
  final MealTime mealTime;
  final DateTime date;
  final String personalMsg;
  // final int totalChickenCount;
  // final int totalFishCount;
  // final int totalStarCount;

}