
import 'package:flutter/material.dart';

class RightPanelWidget extends StatelessWidget {
  RightPanelWidget({Key? key}) : super(key: key);

  final colors = [
    Color(0xFF000000),
    Color(0xFFD81B60),
    Color(0xFF5E35B1),
    Color(0xFF1E88E5),
    Color(0xFF43A047),
  ];

  static const rowHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SHAPE PROPERTIES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildNumberField('x:'),
                    SizedBox(width: 20),
                    _buildNumberField('y:'),
                  ],
                ),
                SizedBox(height: 20),
                _buildNumberField('size:'),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Text('color:'),
                      SizedBox(width: 10),
                      ...colors
                          .map(
                            (color) => Container(
                              color: color,
                              width: 20,
                              height: 20,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MEMENTO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Select the shape.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2. Change color, size or position.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3. Click the "save state" button.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Now you can restore states by selecting them from the list.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        child: Text('Save state'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.white,
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListView(
                          padding: EdgeInsets.all(5),
                          children: [
                            ColoredBox(
                              color: Colors.black.withOpacity(0.02),
                              child: ListTile(
                                leading: Container(
                                  color: Colors.green,
                                  width: 50,
                                  height: double.infinity,
                                  child: Icon(Icons.animation),
                                ),
                                title: Text('Snapshot 1'),
                                subtitle: Text('fefefefsfsdfas'),
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNumberField(String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name),
        SizedBox(width: 10),
        SizedBox(
          width: 50,
          child: TextField(
            controller: TextEditingController(text: '0'),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
