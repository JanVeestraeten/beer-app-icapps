import 'package:beer_app_icapps/base/colors/colors.dart';
import 'package:beer_app_icapps/base/platform_widgets/platform_widgets.dart';
import 'package:beer_app_icapps/screens/overview/overview_viewmodel.dart';
import 'package:beer_app_icapps/screens/overview/widgets/overview_item.dart';
import 'package:beer_app_icapps/screens/overview/widgets/overview_item_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final OverviewViewModel viewModel = OverviewViewModel();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      navigationBar: PlatformAppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.blue),
        title: const Text(
          "Beers",
          style: TextStyle(color: AppColors.blue),
        ),
        actions: [
          Material(
            color: Colors.transparent,
            child: Observer(
              builder: (_) => IconButton(
                  onPressed: () {
                    viewModel.isList = !viewModel.isList;
                  },
                  icon: !viewModel.isList
                      ? const Icon(Icons.list)
                      : const Icon(Icons.grid_view)),
            ),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                child: TabBar(
                  labelColor: AppColors.blue,
                  indicatorColor: AppColors.blue,
                  tabs: [
                    Tab(
                      text: "All beers",
                    ),
                    Tab(
                      text: "Rated beers",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Observer(
                    builder: (_) => viewModel.isList
                        ? ListView.builder(
                            itemCount: viewModel.beers.value?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              if (viewModel.beers.value != null) {
                                return OverviewItem(
                                    beer: viewModel.beers.value![index]);
                              } else {
                                return const SizedBox(height: 0, width: 0);
                              }
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.1,
                            ),
                            itemCount: viewModel.beers.value?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              if (viewModel.beers.value != null) {
                                return OverviewItemGrid(
                                    beer: viewModel.beers.value![index]);
                              } else {
                                return const SizedBox(height: 0, width: 0);
                              }
                            },
                          ),
                  ),
                  Observer(
                    builder: (_) => viewModel.isList
                        ? ListView.builder(
                            itemCount: viewModel.ratedBeers.value?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              if (viewModel.beers.value != null) {
                                return OverviewItem(
                                    beer: viewModel.ratedBeers.value![index]);
                              } else {
                                return const SizedBox(height: 0, width: 0);
                              }
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.1,
                            ),
                            itemCount: viewModel.ratedBeers.value?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              if (viewModel.beers.value != null) {
                                return OverviewItemGrid(
                                    beer: viewModel.ratedBeers.value![index]);
                              } else {
                                return const SizedBox(height: 0, width: 0);
                              }
                            },
                          ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
