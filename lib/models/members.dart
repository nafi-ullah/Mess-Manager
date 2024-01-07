enum MealActivity {
  off,
  chicken,
  fish,
  star
}

List<String> mealCategory = [
  'off',
  'chicken',
  'fish',
  'star'
];

List<String> mealCnt = [
  '1', '2', '3', '4','5',
];


class Meal{
  const Meal({
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
    final MealActivity lunchActivity;
    final int lunchCount;
    final MealActivity dinnerActivity;
    final int dinnerCount;
    final DateTime date;
    final String personalMsg;

    final int totalChickenCount;
    final int totalFishCount;
    final int totalStarCount;

}