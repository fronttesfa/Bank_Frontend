import 'package:flutter/material.dart';

class AccordionCard extends StatefulWidget {
  @override
  _AccordionCardState createState() => _AccordionCardState();
}

class _AccordionCardState extends State<AccordionCard> {
  List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !_data[index].isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          backgroundColor: Theme.of(context).colorScheme.background,
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Banking",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2 accounts",
                        ),
                      ]),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "90,000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          body: const Column(children: [
            ListTile(
              title: Text(
                "Every Day Saving",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "40000",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Every Day Chequing",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "50000",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ]),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Item $index',
      expandedValue: 'This is item number $index',
    );
  });
}
