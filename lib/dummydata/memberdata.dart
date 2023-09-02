import 'package:mess_app/models/members.dart';


final List<Meal> membersInfo = [
Meal(
    userId: 'user1',
    memberName: 'Shaeakh',
    lunchActivity: MealActivity.chicken,
    lunchCount: 2,
    dinnerActivity: MealActivity.fish,
    dinnerCount: 1,
    date: DateTime.now(),
    personalMsg: '2piece',
    totalChickenCount: 3,
    totalFishCount: 1,
    totalStarCount: 0),
Meal(
    userId: 'user2',
    memberName: 'Nafi',
    lunchActivity: MealActivity.star,
    lunchCount: 0,
    dinnerActivity: MealActivity.fish,
    dinnerCount: 0,
    date: DateTime.now(),
    personalMsg:  'amar koi ase',
    totalChickenCount: 0,
    totalFishCount: 0,
    totalStarCount: 1),
Meal(
    userId: 'user3',
    memberName: 'Nixon',
    lunchActivity: MealActivity.fish,
    lunchCount: 1,
    dinnerActivity: MealActivity.chicken,
    dinnerCount: 2,
    date: DateTime.now(),
    personalMsg: 'nothing',
    totalChickenCount: 2,
    totalFishCount: 2,
    totalStarCount: 0),
Meal(
    userId: 'user4',
    memberName: 'Rifaat',
    lunchActivity: MealActivity.off,
    lunchCount: 0,
    dinnerActivity: MealActivity.off,
    dinnerCount: 0,
    date: DateTime.now(),
    personalMsg: 'nothing',
    totalChickenCount: 0,
    totalFishCount:0,
    totalStarCount: 0),
Meal(
    userId: 'user5',
    memberName: 'Arnob',
    lunchActivity: MealActivity.chicken,
    lunchCount: 1,
    dinnerActivity: MealActivity.fish,
    dinnerCount: 1,
    date: DateTime.now(),
    personalMsg: 'nothing',
    totalChickenCount: 2,
    totalFishCount: 1,
    totalStarCount: 0),
// Meal('user6', 'Shaeakh', MealActivity.star, 0, MealActivity.star, 0, DateTime.now(), 0, 0, 0),
// Meal('user7', 'Nafi', MealActivity.fish, 2, MealActivity.star, 1, DateTime.now(), 0, 3, 1),
// Meal('user8', 'Nixon', MealActivity.chicken, 2, MealActivity.chicken, 1, DateTime.now(), 3, 0, 0),
// Meal('user9', 'Rifaat', MealActivity.off, 0, MealActivity.fish, 1, DateTime.now(), 0, 1, 0),
// Meal('user10', 'Arnob', MealActivity.fish, 1, MealActivity.off, 0, DateTime.now(), 0, 0, 0),
// You can now use the dummyData list for testing or display purposes.
];









