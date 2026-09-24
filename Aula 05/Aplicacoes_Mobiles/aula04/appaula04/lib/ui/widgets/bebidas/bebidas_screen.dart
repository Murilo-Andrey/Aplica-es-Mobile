import 'package:appaula04/data/restaurant_data.dart';
import 'package:appaula04/model/restaurant.dart';
import 'package:appaula04/ui/_core/app_colors.dart';
import 'package:appaula04/ui/_core/appbar.dart';
import 'package:appaula04/ui/widgets/home/widget/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BebidasScreen extends StatelessWidget {
  const BebidasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cria o restaurantData
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    // Filtra os restaurantes que tem a categoria Bebidas
    List<Restaurant> listBebidas = restaurantData.listRestaurant
        .where((restaurant) => restaurant.categories.contains('Bebidas'))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: getAppBar(context: context, title: 'Bebidas'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Restaurantes com bebidas',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                spacing: 16,
                children: List.generate(listBebidas.length, (index) {
                  Restaurant restaurant = listBebidas[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
