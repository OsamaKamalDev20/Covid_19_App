import 'package:animate_do/animate_do.dart';
import 'package:covid19_app/colors/app_colors.dart';
import 'package:covid19_app/models/world_states_model.dart';
import 'package:covid19_app/screens/countries_list_screen.dart';
import 'package:covid19_app/services/world_sates_view_model.dart';
import 'package:covid19_app/widgets/world_wide_stats.dart';
import 'package:flutter/material.dart';

class Covid19HomeScreen extends StatefulWidget {
  const Covid19HomeScreen({super.key});

  @override
  State<Covid19HomeScreen> createState() => _Covid19HomeScreenState();
}

class _Covid19HomeScreenState extends State<Covid19HomeScreen> {
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COVID-19 TRACKER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeInRight(
            delay: Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: mediaQuery.size.height * 0.14,
                  color: Colors.orange[100],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontSize: 17,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "WorldWideStats",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryBlack,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "View More",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: stateServices.fetchWorldStatesRecords(),
                      builder:
                          (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInUp(
                              delay: Duration(milliseconds: 1000),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryBlue.withOpacity(.2),
                                        textColor: primaryBlue,
                                        title: "Updated",
                                        value:
                                            snapshot.data!.updated.toString(),
                                        image: "assets/images/updated.png",
                                      ),
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryPurple.withOpacity(.2),
                                        textColor: primaryPurple,
                                        title: "Total Cases",
                                        value: snapshot.data!.cases.toString(),
                                        image: "assets/images/cases.png",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryBlack.withOpacity(.2),
                                        textColor: primaryBlack,
                                        title: "Total Deaths",
                                        value: snapshot.data!.deaths.toString(),
                                        image: "assets/images/deaths.png",
                                      ),
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryGreen.withOpacity(.2),
                                        textColor: primaryGreen,
                                        title: "Recovered",
                                        value:
                                            snapshot.data!.recovered.toString(),
                                        image: "assets/images/recovered.png",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryYellow.withOpacity(.2),
                                        textColor: primaryYellow,
                                        title: "Active Cases",
                                        value: snapshot.data!.active.toString(),
                                        image: "assets/images/active.png",
                                      ),
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryRed.withOpacity(.2),
                                        textColor: primaryRed,
                                        title: "Critical Cases",
                                        value:
                                            snapshot.data!.critical.toString(),
                                        image: "assets/images/critical.png",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryPurple.withOpacity(.2),
                                        textColor: primaryPurple,
                                        title: "Test",
                                        value: snapshot.data!.tests.toString(),
                                        image: "assets/images/test.png",
                                      ),
                                      Covid19WorldWideStates(
                                        containerColor:
                                            primaryBlue.withOpacity(.2),
                                        textColor: primaryBlue,
                                        title: "Populations",
                                        value: snapshot.data!.population
                                            .toString(),
                                        image: "assets/images/population.png",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountriesListScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'Track Countries',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
