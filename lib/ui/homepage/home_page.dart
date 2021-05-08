import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifecoronasafe/data/repository/api_repository_impl.dart';
import 'package:lifecoronasafe/data/repository/api_respository.dart';
import 'package:lifecoronasafe/theme/app_theme.dart';
import 'package:lifecoronasafe/ui/searchpage/search_page.dart';

class HomePage extends StatelessWidget {
  final placeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_active_outlined),
              onPressed: () => Get.toNamed('/notification_settings'))
        ],
      ),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            HomePageCarousel(),
            Gap(20),
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlaceTextField(placeCtrl: placeCtrl),
                  Gap(15),
                  ResourceSelector(),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Verified',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                              fontSize: 17),
                        ),
                        CupertinoSwitch(value: true, onChanged: (val) {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap(30),
            SearchButton(placeCtrl: placeCtrl)
          ],
        ),
      ),
    );
  }
}

class ResourceSelector extends StatelessWidget {
  const ResourceSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text('Select Resource'),
      decoration: AppTheme.inputDecoration(''),
      items: [],
    );
  }
}

class HomePageCarousel extends StatelessWidget {
  HomePageCarousel({
    Key? key,
  }) : super(key: key);

  final carouselInfoList = <Map<String, dynamic>>[
    {
      'info': 'USE\nSANITIZER',
      'image': 'assets/images/sanitizer.png',
      'color': Color(0xFF43D675)
    },
    {
      'info': 'MAINTAIN\nSOCIAL\nDISTANCING',
      'image': 'assets/images/social-distancing.png',
      'color': Color(0xFFD68143)
    },
    {
      'info': 'STAY HOME\nSTAY SAFE',
      'image': 'assets/images/stay-home.png',
      'color': Color(0xFF438FD6)
    },
    {
      'info': 'GET\nVACCINATED',
      'image': 'assets/images/syringe.png',
      'color': Color(0xFFD6436F)
    },
    {
      'info': 'WASH YOUR\nHANDS\nOFTEN',
      'color': Color(0xFF4349D6),
      'image': 'assets/images/wash-hands.png'
    },
    {
      'info': 'ALWAYS\nWEAR\nA MASK',
      'image': 'assets/images/wear-mask.png',
      'color': Color(0xFFD64343),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topCenter,
      child: CarouselSlider(
        options:
            CarouselOptions(height: 200.0, viewportFraction: 1, autoPlay: true),
        items: carouselInfoList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.all(25),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.3,
                        child: AutoSizeText(
                          i['info'].toString(),
                          // maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 19,
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              letterSpacing: 0.2,
                              color: i['color'] as Color,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Image.asset(
                        i['image'].toString(),
                        width: 120,
                      )
                    ],
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}

class PlaceTextField extends StatelessWidget {
  const PlaceTextField({
    Key? key,
    required this.placeCtrl,
  }) : super(key: key);

  final TextEditingController placeCtrl;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: placeCtrl,
          decoration: AppTheme.inputDecoration(
              'Enter State or District To Search Resources For')),
      suggestionsCallback: (pattern) async {
        final APIRepository repo = APIRepositoryImpl();
        return repo.getSearchResults(pattern);
      },
      noItemsFoundBuilder: (context) =>
          ListTile(title: Text('No district(s) found!')),
      loadingBuilder: (context) => SizedBox(),
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.location_city),
          title: Text(suggestion.toString()),
        );
      },
      hideSuggestionsOnKeyboardHide: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      transitionBuilder: (context, suggestionsBox, animationController) =>
          suggestionsBox,
      hideOnError: true,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      keepSuggestionsOnLoading: false,
      getImmediateSuggestions: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select a district';
        }
      },
      onSuggestionSelected: (suggestion) {
        placeCtrl.text = suggestion.toString();
      },
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.placeCtrl,
  }) : super(key: key);

  final TextEditingController placeCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xFF34C759),
      onPressed: () => Get.to(() => SearchPage(
          // state: placeCtrl.text.split(',')[1],
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('SEARCH',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Gap(10),
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
