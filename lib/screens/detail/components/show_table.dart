import 'package:flutter/material.dart';
import 'package:food_recipe_app/utils/constants/text_strings.dart';

class ShowTable {
  static Future showTable(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 3),
          ),
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: h * .02),
              child: Text(
                AppStrings.unitChart,
                style: TextStyle(
                  fontSize: w * .05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
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
              Center(
                child: Text(
                  AppStrings.weightChart,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: w * .05,
                  ),
                ),
              ),
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                children: const [
                  TableRow(
                    children: [
                      ChartTableCell(text1: '1000', text2: 'gram'),
                      ChartTableCell(text1: '1', text2: 'kilogram'),
                      ChartTableCell(text1: '2.2', text2: 'pound'),
                      ChartTableCell(text1: '35.74', text2: 'ounce'),
                    ]
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ChartTableCell extends StatelessWidget {
  const ChartTableCell(
      {super.key, required this.text1, required this.text2, this.text3});

  final String text1, text2;
  final String? text3;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return TableCell(
      child: Container(
        color: Colors.redAccent,
        height: h * .1,
        width: w * .4,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            Text(
              text2,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            if (text3 != null)
              Text(
                text1,
                style: const TextStyle(fontSize: 7, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
