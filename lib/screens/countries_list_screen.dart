import 'package:covid19_app/colors/app_colors.dart';
import 'package:covid19_app/screens/countries_details_screen.dart';
import 'package:covid19_app/services/world_sates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();

    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: AppBar(
        title: Text("Country Lists"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: primaryBlack,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with country name",
                  hintStyle: TextStyle(
                    color: Colors.white70,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white70,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white70,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search, size: 30),
                  prefixIconColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 6,
                      itemBuilder: ((context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 90,
                                    width: 90,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        String name = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountryDetailsStats(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ['countryInfo']["flag"],
                                        continent: snapshot.data![index]
                                            ['continent'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeaths: snapshot.data![index]
                                            ['deaths'],
                                        recovered: snapshot.data![index]
                                            ['recovered'],
                                        activeCases: snapshot.data![index]
                                            ['active'],
                                        populations: snapshot.data![index]
                                            ['population'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Hero(
                                    tag: snapshot.data![index]['countryInfo']
                                        ['flag'],
                                    child: Image(
                                      width: 60,
                                      height: 60,
                                      image: NetworkImage(
                                        snapshot.data![index]['countryInfo']
                                            ["flag"],
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data![index]['country'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index]['continent'],
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailsStats(
                                          name: snapshot.data![index]
                                              ['country'],
                                          image: snapshot.data![index]
                                              ['countryInfo']["flag"],
                                          continent: snapshot.data![index]
                                              ['continent'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          recovered: snapshot.data![index]
                                              ['recovered'],
                                          activeCases: snapshot.data![index]
                                              ['active'],
                                          populations: snapshot.data![index]
                                              ['population'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      width: 90,
                                      height: 90,
                                      image: NetworkImage(
                                        snapshot.data![index]['countryInfo']
                                            ["flag"],
                                      ),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['continent'],
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
