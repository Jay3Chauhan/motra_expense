import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NewIncomeScreen extends StatefulWidget {
  @override
  _NewIncomeScreenState createState() => _NewIncomeScreenState();
}

class _NewIncomeScreenState extends State<NewIncomeScreen> {
  TextEditingController incomeamountController = TextEditingController();

  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    if (result != null) {
      print(result!.files.single.path);
    }
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 0, 168, 107), // Match the red background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Income', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'How much?',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: incomeamountController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    prefixText: '₹',
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '0',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold),
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                // Text(
                //   '\$0',
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 48,
                //       fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(),
                          ),
                          items: <String>[
                            'Food',
                            'Transport',
                            'Shopping',
                            'Salary',
                            'Others'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Wallet',
                            border: OutlineInputBorder(),
                          ),
                          items: <String>['Main Wallet', 'Savings']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Icon(Icons.attach_file),
                            SizedBox(width: 8),
                            Center(
                                child: TextButton(
                              onPressed: () async {
                                result = await FilePicker.platform
                                    .pickFiles(type: FileType.any);
                                setState(() {});
                              },
                              child: Text('Add attachment',
                                  style: TextStyle(color: Colors.grey)),
                            ))
                          ],
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: result?.files.length ?? 0,
                          itemBuilder: (context, index) {
                            return Text(result?.files[index].name ?? '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Repeat', style: TextStyle(fontSize: 16)),
                            Switch(value: false, onChanged: (bool value) {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Color(0xFF6200EE), // Match the purple button color
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Continue', style: TextStyle(fontSize: 16)),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
