import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniprovider/provider/term_provider.dart';

import '../model/classModel.dart';
import '../provider/class_provider.dart';

class InfoTermPage extends StatelessWidget {
  const InfoTermPage(
      {Key? key,
      required this.termProvider,
      required this.index,
      required this.listClass})
      : super(key: key);
  final TermProvider termProvider;
  final int index;
  final List<ClassModel> listClass;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: termProvider),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(160, 128, 128, 255),
        appBar: AppBar(
          title: const Text('Info Term'),
          backgroundColor: const Color.fromARGB(160, 128, 0, 255),
          centerTitle: true,
        ),
        body: Column(children: [
          Consumer<TermProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(100, 128, 0, 255),
                            border: Border.all(width: 2, color: Colors.white)),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                              'Term ${provider.termList[index].termNumber}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(100, 128, 0, 255),
                            border: Border.all(width: 2, color: Colors.white)),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                              'Vahed ${provider.termList[index].counterVahed}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(100, 128, 0, 255),
                            border: Border.all(width: 2, color: Colors.white)),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                              'Class ${provider.termList[index].classOfTerm.length}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Row(children: const [
            Expanded(
                child: Divider(
              thickness: 1.5,
              color: Colors.white,
            )),
          ]),
          Expanded(
            child: Consumer<TermProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.termList[index].classOfTerm.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () {},
                    child: Card(
                      color: Color.fromARGB(180, 255, 128, 255),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                      elevation: 30,
                      margin: const EdgeInsets.all(12),
                      child: Container(
                        height: 135,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.book,
                                size: 35, color: Colors.white),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 10, right: 20, bottom: 10),
                                  child: Text(
                                      'Class Name     :   ${listClass[i].className} '),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 10, right: 20, bottom: 10),
                                  child: Text(
                                      'Teacher Name :  ${listClass[i].teacherName}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, top: 10, right: 20, bottom: 10),
                                  child: Text(
                                    'Vahed Number :  ${listClass[i].vahed}',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                  onTap: () {
                                    provider.deleteClassInTerm(index, i);
                                  },
                                  child: const Icon(Icons.delete_sweep_sharp,
                                      color: Colors.black, size: 30)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                width: 200,
                child: Consumer2<ClassProvider, TermProvider>(
                  builder: (context, classProvider, termProvider, child) {
                    return ElevatedButton(
                        onPressed: () {
                          showDialogClass(
                              context, classProvider, termProvider, index);
                        },
                        child: const Text('Edit'));
                  },
                )),
          ),
        ]),
      ),
    );
  }

  void showDialogClass(BuildContext context, ClassProvider classProvider,
      TermProvider termProvider, int indexTerm) {
    showDialog(
      context: context,
      barrierColor: Colors.white24,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 4,
                )),
            title: const Text('Edite Class'),
            actions: [
              Container(
                width: 300,
                height: 500,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: classProvider.classList.length,
                  itemBuilder: (context, index) => InkWell(
                    child: Card(
                      color: const Color.fromARGB(100, 128, 128, 255),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                      elevation: 30,
                      margin: const EdgeInsets.all(8),
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(Icons.book,
                                size: 25, color: Colors.white),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, right: 10, bottom: 6),
                                  child: Text(
                                      'Class Name     :   ${classProvider.classList[index].className} '),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 6, right: 10, bottom: 6),
                                  child: Text(
                                      'Teacher Name :  ${classProvider.classList[index].teacherName}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 6, right: 10, bottom: 6),
                                  child: Text(
                                    'Vahed Number :  ${classProvider.classList[index].vahed}',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                  onTap: () {
                                    ClassModel classModel = ClassModel(
                                        classProvider
                                            .classList[index].className,
                                        classProvider
                                            .classList[index].teacherName,
                                        classProvider.classList[index].vahed!);
                                    termProvider.addClassInTerm(
                                        indexTerm, classModel);
                                  },
                                  child: const Icon(Icons.add_box_rounded,
                                      color: Colors.black, size: 20)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('CLOSE')),
              ),
            ],
          ),
        );
      },
    );
  }
}
