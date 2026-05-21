import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentange;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentange);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          Container(
            height: constraint.maxHeight * 0.2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "\$ ${spendingAmount.toStringAsFixed(0)}",
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: constraint.maxHeight * 0.005),
          Container(
            //width: 15,
            height: constraint.maxHeight * 0.6,
            child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.center,
                heightFactor: spendingPercentange,
                child: Container(
                  width: constraint.maxWidth * 0.3,
                  height: constraint.maxHeight * 0.6,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Container(
                width: constraint.maxWidth * 0.3,
                height: constraint.maxHeight * 0.6,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColorDark, width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ]),
          ),
          SizedBox(height: constraint.maxHeight * 0.05),
          Container(
            height: constraint.maxHeight * 0.1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(label,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      );
    });
  }
}
