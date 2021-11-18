import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/category_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/cocktail_list_bloc/cock_tail_list_bloc.dart';
import 'package:flutter_retrofit_basic/constant_string.dart';
import 'package:flutter_retrofit_basic/models/cock_tail.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_category.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _cateName;
  late CockTailListBloc _cockTailListBloc;
  late bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(FetchCategories());
    _cockTailListBloc = context.read<CockTailListBloc>();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstTime) _openDrawer();
    return Scaffold(
        key: _scaffoldKey,
        body: BlocBuilder<CockTailListBloc, CockTailListState>(
          builder: (context, state) {
            if (state is CockTailListFetchSuccessState) {
              int count = MediaQuery.of(context).size.width ~/ 200;
              return GridView.builder(
                  itemCount: state.baseResponse.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (200 / 250), crossAxisCount: count),
                  itemBuilder: (context, index) {
                    Cocktail cockTail = state.baseResponse.data![index];
                    return _gridItem(context, cockTail);
                  });
            }

            if (state is CockTailListFetchFailState) {
              return const Center(child: Text(ConstStrings.fail));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        drawer: Drawer(
          child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
            if (state is CategoryFetchSuccessState) {
              if (_isFirstTime) {
                _cateName = state.baseResponse.data![0].name;
                _cockTailListBloc.add(FetchCocktailListEvent(_cateName));
                _isFirstTime = false;
              }
              return ListView.builder(
                  itemCount: state.baseResponse.data!.length,
                  itemBuilder: (context, index) {
                    final CockTailCategory category =
                        state.baseResponse.data![index];
                    return ListTile(
                      onTap: () {
                        _cateName = category.name;
                        _cockTailListBloc
                            .add(FetchCocktailListEvent(_cateName));
                        _closeDrawer();
                      },
                      title: Text(category.name),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(category.name[0]),
                      ),
                    );
                  });
            }
            if (state is CategoryLoadingFail) {
              return const Center(child: Text(ConstStrings.fail));
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
        appBar: AppBar(
          title: const Text("Drinks"),
        ));
  }

  _goToNextPage(BuildContext context, Cocktail cocktail) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(cocktail)));
  }

  Widget _gridItem(BuildContext context, Cocktail cockTail) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        child: InkWell(
          onTap: () => _goToNextPage(context, cockTail),
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(cockTail.strDrinkThumb, fit: BoxFit.cover),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      cockTail.strDrink,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _openDrawer() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => _scaffoldKey.currentState!.openDrawer());
  }

  void _closeDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }
}