import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_basic/bloc/cocktail_detail/cock_tail_detail_bloc.dart';
import 'package:flutter_retrofit_basic/models/cock_tail.dart';
import 'package:flutter_retrofit_basic/models/cock_tail_details.dart';

class DetailPage extends StatefulWidget {
  final Cocktail cocktail;

  const DetailPage(this.cocktail, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CockTailDetailBloc>()
        .add(FetchCockTailDetailEvent(widget.cocktail.idDrink));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.cocktail.strDrink)),
      body: BlocBuilder<CockTailDetailBloc, CockTailDetailState>(
        builder: (context, state) {
          if (state is CockTailDetailLoadingSuccess) {
            CockTailDetails details = state.baseResponse.data![0];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child:
                                Image.network(widget.cocktail.strDrinkThumb))),
                    const SizedBox(height: 16),
                    const Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 16),
                    Text(
                        "${details.strIngredient1 != null ? "${details.strIngredient1}(${details.strMeasure1})," : ""}"
                        "${details.strIngredient2 != null ? " ${details.strIngredient2}(${details.strMeasure2})," : ""}"
                        "${details.strIngredient3 != null ? " ${details.strIngredient3}(${details.strMeasure3})," : ""}"
                        "${details.strIngredient4 != null ? " ${details.strIngredient4}(${details.strMeasure4})," : ""}"
                        "${details.strIngredient5 != null ? " ${details.strIngredient5}(${details.strMeasure5})," : ""}"
                        "${details.strIngredient6 != null ? " ${details.strIngredient6}(${details.strMeasure6})," : ""}"
                        "${details.strIngredient7 != null ? " ${details.strIngredient7}(${details.strMeasure7})," : ""}"
                        "${details.strIngredient8 != null ? " ${details.strIngredient8}(${details.strMeasure8})," : ""}"
                        "${details.strIngredient9 != null ? " ${details.strIngredient9}(${details.strMeasure9})," : ""}"
                        "${details.strIngredient10 != null ? " ${details.strIngredient10}(${details.strMeasure10})," : ""}"
                        "${details.strIngredient11 != null ? " ${details.strIngredient11}(${details.strMeasure11})," : ""}"
                        "${details.strIngredient12 != null ? " ${details.strIngredient12}(${details.strMeasure12})," : ""}"
                        "${details.strIngredient13 != null ? " ${details.strIngredient13}(${details.strMeasure13})," : ""}"
                        "${details.strIngredient14 != null ? " ${details.strIngredient14}(${details.strMeasure14})," : ""}"
                        "${details.strIngredient15 != null ? " ${details.strIngredient15}(${details.strMeasure15})," : ""}"),
                    const SizedBox(height: 16),
                    const Text("Procedure", style: TextStyle(fontSize: 25)),
                    const SizedBox(height: 16),
                    Text("${details.strInstructions}"),
                    const SizedBox(height: 16),
                    const Text("******"),
                    const Text(
                        "1 oz = 26 ml \n1 dash  = 0.9 ml \n1 pint = 284.131 ml"),
                    const Text("******")
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
