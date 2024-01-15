import 'package:flutter/material.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class MonthlyMeal extends StatefulWidget {
  const MonthlyMeal({super.key});

  @override
  State<MonthlyMeal> createState() => _MonthlyMealState();
}

class _MonthlyMealState extends State<MonthlyMeal> {
  List<MembersMeal> meals = [];
  List<String> allMembers = [];
  List<DataRow> filteredRows = [];

  final MealService mealService = MealService();
  fetchAllMeals() async {
    meals = await mealService.fetchAllMeals(context);
    for (var user in meals) {
      allMembers.add(user.name);
    }
    setState(() {
    });
  }

  List<DataRow> getFilteredRows(String userName) {


    for (var user in meals) {
      if (user.name == userName) {
        filteredRows.add(
          DataRow(
            cells: [
              DataCell(Text(user.date)),
              DataCell(Text(user.lunchMeal)),
              DataCell(Text(user.dinnerMeal)),
            ],
          ),
        );
      }
    }

    return filteredRows;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllMeals();
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    String? selectedValue = userProvider.name;
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: allMembers.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          hint: Text('Select a member'),
        ),
        DataTable(
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Lunch')),
              DataColumn(label: Text('Dinner')),
            ],

            rows: filteredRows
    )
    ]
    );
  }
}
