part of pets_module;

class EditSpeciesPetSheet extends StatelessWidget {
  EditSpeciesPetSheet({
    Key? key,
  }) : super(key: key);

  final PetsController petController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: AppSize.s25.circularRadius),
      child: Column(
        children: [
          Container(
              height: AppSize.s60.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorManager.primaryWithTransparent10))),
              child: const Text(
                AppStrings.chooseYourPetSpecies,
                style: titleBold,
              )),
          AppSize.s30.addVerticalSpace,
          // ListView.builder(itemBuilder: SelectionTypeCard(type: "",)),
          Expanded(
            child: GetBuilder<PetsController>(
                builder: (GetxController controller) => ListView.builder(
                      itemBuilder: (context, index) {
                        final type = petController.petTypes[index];
                        return SelectionTypeCard(
                            type: type.name,
                            iconPath: type.iconPath,
                            backgroundColor: type.backgroundColor,
                            isSelected: type.isSelect,
                            onTap: () {});
                      },
                      itemCount: petController.petTypes.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    )
                ),
          ),
          AppSize.s70.addVerticalSpace,
          ElevatedButton(
              onPressed: () {
                RouteService.serviceNavi.back();
              },
              child: const Text("Done")),
          AppSize.s40.addVerticalSpace,
        ],
      ),
    );
  }
}
