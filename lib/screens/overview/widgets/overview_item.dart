import 'package:beer_app_icapps/base/colors/colors.dart';
import 'package:beer_app_icapps/base/platform_widgets/platform_route.dart';
import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/screens/detail/beer_detail.dart';
import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    Key? key,
    required this.beer,
  }) : super(key: key);

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(PlatformRoute(
          route: BeerDetail(
        id: beer.id,
        beer: beer,
      ))),
      child: SizedBox(
        height: 80,
        child: Card(
          color: AppColors.blue,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Hero(
                        tag: beer.imageUrl,
                        child: Image.network(beer.thumbImageUrl))),
              ),
              // const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(beer.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(beer.brewery?.name ?? "",
                      style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Spacer(),
              if (beer.rating != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(beer.rating?.toString() ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
