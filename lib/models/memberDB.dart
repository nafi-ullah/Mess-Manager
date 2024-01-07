enum mealMenu {
  Off,
  Chicken,
  Fish,
  Rice
}


class MealInfo{
  const MealInfo({
    required this.userId,
    required this.memberName,
    required this.lunchActivity,
    required this.lunchCount,
    required this.dinnerActivity,
    required this.dinnerCount,
    required this.date,
    required this.personalMsg,

    required this.totalChickenCount,
    required this.totalFishCount,
    required this.totalStarCount,
  });

  final String userId;
  final String memberName;
  final mealMenu lunchActivity;
  final int lunchCount;
  final mealMenu dinnerActivity;
  final int dinnerCount;
  final DateTime date;
  final String personalMsg;
  final int totalChickenCount;
  final int totalFishCount;
  final int totalStarCount;

}