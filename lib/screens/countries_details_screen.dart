// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:covid19_app/colors/app_colors.dart';
import 'package:covid19_app/widgets/world_wide_stats.dart';
import 'package:flutter/material.dart';

class CountryDetailsStats extends StatefulWidget {
  String name;
  String image;
  String continent;
  int totalCases, totalDeaths, recovered, activeCases, populations;
  CountryDetailsStats({
    super.key,
    required this.name,
    required this.image,
    required this.continent,
    required this.totalCases,
    required this.totalDeaths,
    required this.recovered,
    required this.activeCases,
    required this.populations,
  });

  @override
  State<CountryDetailsStats> createState() => _CountryDetailsStatsState();
}

class _CountryDetailsStatsState extends State<CountryDetailsStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      appBar: AppBar(
        title: Text("Country Details Stats"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: primaryBlack,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: widget.image,
                    child: Image.network(
                      widget.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FadeInLeft(
                delay: Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.continent,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.populations.toString(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FadeInLeft(
                delay: Duration(milliseconds: 1000),
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              FadeInLeft(
                delay: Duration(milliseconds: 1000),
                child: Text(
                  "A country ${widget.name} is a geographic region that is recognized as an independent nation located in ${widget.continent}. The population of ${widget.name} is around ${widget.populations} millions / billions.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeInLeft(
                delay: Duration(milliseconds: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "COVID-19 Stats",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    FadeInLeft(
                      delay: Duration(milliseconds: 1000),
                      child: Text(
                        "Country ${widget.name} has around Total of ${widget.totalCases} COVID-19 Cases out which ${widget.activeCases} are active cases. A total of ${widget.totalDeaths} peoples are died and a total of ${widget.recovered} peoples are recovered from it",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              FadeInUp(
                delay: Duration(milliseconds: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Covid19WorldWideStates(
                          containerColor: primaryBlue.withOpacity(.2),
                          textColor: primaryBlue,
                          title: "Total Cases",
                          value: widget.totalCases.toString(),
                          image: "assets/images/cases.png",
                        ),
                        Covid19WorldWideStates(
                          containerColor: primaryGreen.withOpacity(.2),
                          textColor: primaryGreen,
                          title: "Recovered",
                          value: widget.recovered.toString(),
                          image: "assets/images/recovered.png",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Covid19WorldWideStates(
                          containerColor: primaryRed.withOpacity(.2),
                          textColor: primaryRed,
                          title: "Total Deaths",
                          value: widget.totalDeaths.toString(),
                          image: "assets/images/deaths.png",
                        ),
                        Covid19WorldWideStates(
                          containerColor: primaryYellow.withOpacity(.2),
                          textColor: primaryYellow,
                          title: "Active Cases",
                          value: widget.activeCases.toString(),
                          image: "assets/images/cases.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
