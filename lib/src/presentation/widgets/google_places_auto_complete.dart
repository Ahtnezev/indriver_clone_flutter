
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GooglePlacesAutoComplete extends StatelessWidget {
  TextEditingController controller;
  String  hintText;
  Function(Prediction prediction) onPlaceSelected;

  GooglePlacesAutoComplete(this.controller, this.hintText, this.onPlaceSelected, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        boxDecoration:  BoxDecoration(
          color: Colors.white
        ),
        googleAPIKey:"YOUR_GOOGLE_API_KEY", //! important
        inputDecoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["mx", "es"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: onPlaceSelected,

        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,
        
        // Optional: specify keyboard type (defaults to TextInputType.streetAddress)
        // keyboardType: TextInputType.text,


        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text("${prediction.description ?? ""}"))
              ],
            ),
          );
        },

        isCrossBtnShown: true,

        // default 600 ms ,
      ),
    );
  }
}