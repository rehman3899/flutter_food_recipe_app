import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class ShowTable {
  // Static method to show a dialog with conversion tables
  static Future showTable(BuildContext context) {
    // Retrieve the height and width of the device screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Display a dialog with the conversion tables
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.zero, // Removes default padding around content
          shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.white,
                width: 3), // White border around the dialog
          ),
          backgroundColor: Colors.redAccent, // Dialog background color

          // Dialog title
          title: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: h * .02), // Spacing below the title
              child: Text(
                AppStrings.unitChart, // Title text from constants
                style: TextStyle(
                  fontSize: w * .05, // Font size based on screen width
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Dialog content
          content: Column(
            mainAxisSize: MainAxisSize.min, // Minimum size for the column
            children: [
              // Table displaying unit conversions
              Table(
                border: TableBorder.all(
                  color: Colors.white, // Border color of the table
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  // Table rows and cells for unit conversions
                  TableRow(
                    children: [
                      ChartTableCell(text1: 'CUP', text2: '(cup)'),
                      ChartTableCell(text1: 'OUNCE', text2: '(oz)'),
                      ChartTableCell(
                          text1: 'TABLE', text2: 'SPOON', text3: '(tbsp)'),
                      ChartTableCell(
                          text1: 'TEA', text2: 'SPOON', text3: '(tsp)'),
                      ChartTableCell(
                          text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                    ],
                  ),
                  TableRow(
                    children: [
                      ChartTableCell(text1: '1', text2: 'cup'),
                      ChartTableCell(text1: '8', text2: 'oz'),
                      ChartTableCell(text1: '16', text2: 'tbsp'),
                      ChartTableCell(text1: '48', text2: 'tsp'),
                      ChartTableCell(text1: '237', text2: 'ml'),
                    ],
                  ),
                  TableRow(
                    children: [
                      ChartTableCell(text1: '1/8', text2: 'cup'),
                      ChartTableCell(text1: '1', text2: 'oz'),
                      ChartTableCell(text1: '2', text2: 'tbsp'),
                      ChartTableCell(text1: '6', text2: 'tsp'),
                      ChartTableCell(text1: '30', text2: 'ml'),
                    ],
                  ),
                  TableRow(
                    children: [
                      ChartTableCell(text1: '1/16', text2: 'cup'),
                      ChartTableCell(text1: '0.5', text2: 'oz'),
                      ChartTableCell(text1: '1', text2: 'tbsp'),
                      ChartTableCell(text1: '3', text2: 'tsp'),
                      ChartTableCell(text1: '15', text2: 'ml'),
                    ],
                  ),
                  TableRow(
                    children: [
                      ChartTableCell(text1: '1/48', text2: 'cup'),
                      ChartTableCell(text1: '0.16', text2: 'oz'),
                      ChartTableCell(text1: '1/3', text2: 'tbsp'),
                      ChartTableCell(text1: '1', text2: 'tsp'),
                      ChartTableCell(text1: '5', text2: 'ml'),
                    ],
                  ),
                ],
              ),
              // Label for weight conversion chart
              Center(
                child: Text(
                  AppStrings.weightChart, // Weight chart label from constants
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: w * .05,
                  ),
                ),
              ),
              // Table displaying weight conversions
              Table(
                border: TableBorder.all(
                  color: Colors.white, // Border color of the table
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  TableRow(children: [
                    ChartTableCell(text1: '1000', text2: 'gram'),
                    ChartTableCell(text1: '1', text2: 'kilogram'),
                    ChartTableCell(text1: '2.2', text2: 'pound'),
                    ChartTableCell(text1: '35.74', text2: 'ounce'),
                  ])
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

// Custom widget for a table cell displaying conversion data
class ChartTableCell extends StatelessWidget {
  const ChartTableCell(
      {super.key, required this.text1, required this.text2, this.text3});

  final String text1, text2;
  final String? text3; // Optional third text line

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return TableCell(
      child: Container(
        color: Colors.redAccent, // Background color of the cell
        height: h * .1, // Cell height based on screen height
        width: w * .4, // Cell width based on screen width
        padding: const EdgeInsets.all(8), // Padding inside the cell
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center-align content vertically
          children: [
            Text(
              text1,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            Text(
              text2,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            if (text3 != null) // If there is a third text line, display it
              Text(
                text3!,
                style: const TextStyle(fontSize: 7, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
