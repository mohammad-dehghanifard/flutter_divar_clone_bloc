import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/data/model/province_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProvinceAndCityBottomSheetWidget extends StatelessWidget {
  const ProvinceAndCityBottomSheetWidget({
    super.key, required this.provinceList, required this.onCityTap,
  });

  final List<ProvinceModel> provinceList;
  final Function(ProvinceModel province,CityModel city) onCityTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:provinceList.length,
      itemBuilder: (context, index) {
        final ProvinceModel province = provinceList[index];
        return Padding(
          padding: EdgeInsets.all(4.w),
          child: ExpansionTile(
            title: Text(province.name!),
            children: List.generate(province.cities!.length, (index) {
              return TextButton(onPressed: () {
                onCityTap(province,province.cities![index]);
              }, child: Text(province.cities![index].name!));
            },),
          ),
        );
      },
    );
  }
}
