import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniprovider/custom_view/textfiled.dart';
import 'package:uniprovider/model/classModel.dart';
import 'package:uniprovider/ui_page/infoTermPage.dart';

import '../provider/class_provider.dart';
import '../provider/term_provider.dart';

class ClassTermPage extends StatelessWidget {
  const ClassTermPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TermProvider()),
        ChangeNotifierProvider(create: (context) => ClassProvider())
      ],
      child: MaterialApp(
        home: DefaultTabController(
          animationDuration: Duration(seconds: 1),
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(100, 128, 0, 255),
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  borderSide: BorderSide(width: 2, color: Colors.purple)),
              title: const Text('Class Term'),
              centerTitle: true,
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'Class',
                ),
                Tab(
                  text: 'Term',
                ),
              ]),
            ),
            body: TabBarView(children: [
              tabClass(),
              tabTerm(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget tabClass() {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 128, 0, 255),
      body: Consumer<ClassProvider>(builder: (context, provider, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: provider.classList.length,
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
                height: 135,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.book, size: 35, color: Colors.white),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 10, right: 20, bottom: 10),
                          child: Text(
                              'Class Name     :   ${provider.classList[index].className} '),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 10, right: 20, bottom: 10),
                          child: Text(
                              'Teacher Name :  ${provider.classList[index].teacherName}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 10, right: 20, bottom: 10),
                          child: Text(
                            'Vahed Number :  ${provider.classList[index].vahed}',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: InkWell(
                            child: const Icon(Icons.edit_note,
                                color: Colors.white, size: 30),
                            onTap: () {
                              showDialogs(context, false, index, provider);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                              onTap: () {
                                provider.removeClass(index);
                              },
                              child: const Icon(Icons.delete_sweep_sharp,
                                  color: Colors.black, size: 30)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton:
          Consumer<ClassProvider>(builder: (context, provider, child) {
        return FloatingActionButton(
            onPressed: () {
              showDialogs(context, true, 0, provider);
            },
            child: const Icon(Icons.add));
      }),
    );
  }

  void showDialogs(
      BuildContext context, bool flotAct, int index, ClassProvider provider) {
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
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFiledCu(
                      initialValue:
                          flotAct ? null : provider.classList[index].className,
                      obscureText: false,
                      borderColor: Colors.black,
                      width: 1,
                      borderRadius: 20,
                      icon: const SizedBox(),
                      suffixIcon: const SizedBox(),
                      labelText: 'Class Name',
                      onTap: () {},
                      onChange: (value) {
                        provider.className = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFiledCu(
                      initialValue: flotAct
                          ? null
                          : provider.classList[index].teacherName,
                      obscureText: false,
                      borderColor: Colors.black,
                      width: 1,
                      borderRadius: 20,
                      icon: const SizedBox(),
                      suffixIcon: const SizedBox(),
                      labelText: 'Teacher Name',
                      onTap: () {},
                      onChange: (value) {
                        provider.teacherName = value;
                      },
                    ),
                  ),
                  TextFiledCu(
                    initialValue: flotAct
                        ? null
                        : provider.classList[index].vahed.toString(),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    borderColor: Colors.black,
                    width: 1,
                    borderRadius: 20,
                    icon: const SizedBox(),
                    suffixIcon: const SizedBox(),
                    labelText: 'Vahed Number',
                    onTap: () {},
                    onChange: (value) {
                      provider.vahed = int.parse(value);
                    },
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 15),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            if (flotAct) {
                              provider.addClass(provider.className,
                                  provider.teacherName, provider.vahed);
                            } else {
                              provider.editClass(provider.className,
                                  provider.teacherName, provider.vahed, index);
                            }
                            Navigator.pop(context, true);
                          },
                          child: const Text('SAVE'),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  void showDialogTerm(BuildContext context, TermProvider provider) {
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
              Padding(
                padding: const EdgeInsets.all(7),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFiledCu(
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      borderColor: Colors.black,
                      width: 1,
                      borderRadius: 20,
                      icon: const SizedBox(),
                      suffixIcon: const SizedBox(),
                      labelText: 'Term Number',
                      onTap: () {},
                      onChange: (value) {
                        provider.termNumber = int.parse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextFiledCu(
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      borderColor: Colors.black,
                      width: 1,
                      borderRadius: 20,
                      icon: const SizedBox(),
                      suffixIcon: const SizedBox(),
                      labelText: 'Vahed Number',
                      onTap: () {},
                      onChange: (value) {
                        provider.vahedNumber = int.parse(value);
                      },
                    ),
                  ),
                  TextFiledCu(
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    borderColor: Colors.black,
                    width: 1,
                    borderRadius: 20,
                    icon: const SizedBox(),
                    suffixIcon: const SizedBox(),
                    labelText: 'Class Number',
                    onTap: () {},
                    onChange: (value) {
                      provider.classNumber = int.parse(value);
                    },
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 15),
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            provider.addTerm();
                            Navigator.pop(context, true);
                          },
                          child: const Text('SAVE'),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget tabTerm() {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 128, 0, 255),
      body: Consumer<TermProvider>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.termList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              TermProvider();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoTermPage(
                      termProvider: provider,
                      index: index,
                      listClass: provider.termList[index].classOfTerm),
                ),
              );
            },
            child: Card(
              shape: const CircleBorder(
                  side: BorderSide(width: 4, color: Colors.white)),
              elevation: 30,
              shadowColor: Colors.black,
              color: const Color.fromARGB(100, 128, 128, 255),
              margin: const EdgeInsets.all(20),
              child: Container(
                height: 220,
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 50, bottom: 15),
                        child: Icon(Icons.terminal),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Term Number   :   ${provider.termList[index].termNumber}',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Vahed Number :   ${provider.termList[index].counterVahed}',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                            'Class Number  :   ${provider.termList[index].classNumber}'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton:
          Consumer<TermProvider>(builder: (context, provider, child) {
        return FloatingActionButton(
            onPressed: () {
              showDialogTerm(context, provider);
            },
            child: const Icon(Icons.add));
      }),
    );
  }
}
