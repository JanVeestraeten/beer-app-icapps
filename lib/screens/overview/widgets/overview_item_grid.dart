import 'package:beer_app_icapps/base/colors/colors.dart';
import 'package:beer_app_icapps/base/platform_widgets/platform_route.dart';
import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/screens/detail/beer_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OverviewItemGrid extends StatelessWidget {
  const OverviewItemGrid({
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
        child: Card(
          color: AppColors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Hero(
                          tag: beer.imageUrl,
                          child: CachedNetworkImage(
                              imageUrl: beer.thumbImageUrl))),
                ),
              ),
              // const SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(beer.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                        child: Text(beer.brewery?.name ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white38,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              if (beer.rating != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
