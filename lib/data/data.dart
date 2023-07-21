class SliderModel {
  late String imageAssetPath;
  late String title;
  late String desc;

// setter

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  // getter
  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

// providing data to the class using list

List<SliderModel> getSlides() {
  //creating a empty list
  List<SliderModel> slides = [];

  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/images/plant.png");
  sliderModel.setTitle("Farmers Insurance Assistance");
  sliderModel.setDesc("By Ananya and Sai");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/images/black-spot-leaf.png");
  sliderModel.setTitle(
      "Speeding up the process of insurance claims and enlightening farmers about best insurance practices.");
  sliderModel.setDesc("");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/images/pana.png");
  sliderModel.setTitle("Know about different insurance and Claim Procedures.");
  sliderModel.setDesc("");
  slides.add(sliderModel);
  sliderModel = SliderModel();

  //4
  sliderModel.setImageAssetPath("assets/images/Farmer-amico.png");
  sliderModel
      .setTitle("Know about different services offered by our application.");
  sliderModel.setDesc("");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
