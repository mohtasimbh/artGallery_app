import 'package:flutter/material.dart';
//import 'package:glarryapp/ApiDara/HttpRequest.dart';
//import 'package:glarryapp/ApiDara/Model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sakir_exam_3/ApiDara/HttpRequest.dart';
import 'package:sakir_exam_3/ApiDara/Model.dart';
import 'package:sakir_exam_3/viewpage.dart';

// Text(_userModel![index].id.toString()),
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<GModel>? _userModel = [];
  GModel? alluser;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await CustomHttpRequest().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 225, 211, 211),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 225, 211, 211),
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 204, 140, 43),
                  ),
                  Icon(
                    Icons.filter,
                    color: Color.fromARGB(255, 204, 140, 43),
                  ),
                ],
              ),
            ),
            title: Center(
                child: const Text(
              'My Artworks',
              style: TextStyle(color: Colors.black, fontSize: 30),
            )),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18, 3, 0),
                child: Text(
                  'Show',
                  style: TextStyle(color: Color.fromARGB(255, 204, 140, 43)),
                ),
              ),
              Icon(
                Icons.search,
                color: Color.fromARGB(255, 35, 33, 30),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            // onTap: _onItemTapped,
          ),
          body: _userModel == null || _userModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  physics: ScrollPhysics(),
                  itemCount: _userModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewPage(
                              gModel: _userModel![index],
                            ),
                          ));
                        }),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                Image.network(
                                  _userModel![index].downloadUrl.toString(),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 10,
                                  child: Text(
                                    _userModel![index].author.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
