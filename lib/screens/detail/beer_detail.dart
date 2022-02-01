import 'dart:io';
import 'package:beer_app_icapps/base/colors/colors.dart';
import 'package:beer_app_icapps/base/platform_widgets/platform_widgets.dart';
import 'package:beer_app_icapps/database/database.dart';
import 'package:beer_app_icapps/screens/detail/beer_detail_viewmodel.dart';
import 'package:beer_app_icapps/screens/detail/widgets/brewery_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beer_app_icapps/base/platform_widgets/platform_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BeerDetail extends StatefulWidget {
  const BeerDetail({
    Key? key,
    required this.id,
    required this.beer,
  }) : super(key: key);

  final String id;
  final Beer beer;

  @override
  State<BeerDetail> createState() => _BeerDetailState();
}

class _BeerDetailState extends State<BeerDetail> {
  late BeerDetailViewModel viewModel;

  @override
  void initState() {
    viewModel = BeerDetailViewModel(id: widget.id);
    viewModel.newRating = widget.beer.rating!.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      navigationBar: PlatformAppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.blue),
        title: Observer(
            builder: (_) => Text(
                  viewModel.beerStream.value?.name ?? "",
                  style: const TextStyle(color: AppColors.blue),
                )),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Hero(
                tag: widget.beer.imageUrl,
                child: CachedNetworkImage(
                  imageUrl: widget.beer.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Observer(
              builder: (_) => (viewModel.beerStream.value?.brewery != null)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BreweryInfo(brewery: widget.beer.brewery!),
                    )
                  : const SizedBox(height: 0, width: 0),
            ),
            Observer(
              builder: (_) => (viewModel.beerStream.value?.rating != null)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          "Current rating: ${viewModel.beerStream.value!.rating}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Rate this beer",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Column(
              children: [
                Observer(
                  builder: (_) => Slider.adaptive(
                    value: viewModel.newRating,
                    max: 5.0,
                    min: 0.0,
                    divisions: 5,
                    onChanged: (value) => viewModel.newRating = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("0"),
                      Text("1"),
                      Text("2"),
                      Text("3"),
                      Text("4"),
                      Text("5"),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Observer(
                    builder: (_) => Platform.isIOS
                        ? CupertinoButton.filled(
                            // When the current rating is equal to the selected value we disable the button
                            // API gives error when we try to send a rating of 0, so we disable the button when this is the selected value
                            onPressed: viewModel.currentRating ==
                                        viewModel.newRating ||
                                    viewModel.newRating == 0
                                ? null
                                : () async {
                                    await viewModel.rateBeer(
                                        id: widget.beer.id);
                                  },
                            child: const Text("Rate this beer"))
                        : MaterialButton(
                            color: AppColors.blue,
                            // When the current rating is equal to the selected value we disable the button
                            // API gives error when we try to send a rating of 0, so we disable the button when this is the selected value
                            onPressed: viewModel.currentRating ==
                                        viewModel.newRating ||
                                    viewModel.newRating == 0
                                ? null
                                : () async {
                                    await viewModel.rateBeer(
                                        id: widget.beer.id);
                                  },
                            disabledColor: Colors.grey[300],
                            child: const Text("Rate this beer",
                                style: TextStyle(color: Colors.white))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
