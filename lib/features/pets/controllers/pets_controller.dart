part of pets_module;

class PetsController extends GetxController{
  PetsController({required this.petRepo});
  final PetRepo petRepo;
  List<PetModel> pets = [];
  final PageController pageController = PageController();
  final List<AddPetModel> petTypes = AddPetModel.petSpecies;

  Future<dynamic> getPets() async {
    pets = await petRepo.getPetsRepo() ;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPets();
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //-------------------------------editPet--------------------------------------

  final TextEditingController editNamePetController = TextEditingController();
  final TextEditingController editBreedPetController = TextEditingController();
  initEditPet(){

  }

  changePetType({required String petType}){
    for(var item in petTypes){
      item.isSelect = item.name == petType;
    }
  }


}
