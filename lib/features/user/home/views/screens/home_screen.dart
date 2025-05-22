import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/cache/cache_helper.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/components/custom_icon_button.dart';
import 'package:safe_steps/core/components/custom_text_form_field.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/local_notifications/local_notifications_services.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/home/models/feature_model.dart';
import 'package:safe_steps/features/user/home/view_models/cubit/drawer_cubit.dart';
import 'package:safe_steps/features/user/home/views/widgets/custom_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          var cubit = context.read<DrawerCubit>();
          return Scaffold(
            key: cubit.key,
            drawer: CustomDrawer(
              drawerItems: cubit.drawerItems,
              userModel: getIt<CacheHelper>().getUserModel()!,
            ),
            body: HomeScreenBody(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.kThirdColor,
              child: Icon(
                Icons.menu_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                cubit.openDrawer();
              },
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<FeatureModel> features = [
      FeatureModel(
        title: "Real-Time Tracking",
        description: "Track your loved ones with GPS precision.",
        iconData: Icons.location_on_outlined,
      ),
      FeatureModel(
        title: "Geo-Fencing",
        description:
            "Set safe zones and receive alerts if boundaries are crossed.",
        iconData: Icons.map_outlined,
      ),
      FeatureModel(
        title: "SOS Button",
        description: "Quick SOS button for caregivers in emergencies.",
        iconData: Icons.sos_outlined,
      ),
      FeatureModel(
        title: "Two-Way Communication",
        description: "Stay connected with built-in microphone and speaker.",
        iconData: Icons.connect_without_contact_outlined,
      ),
      FeatureModel(
        title: "Vibration for Hearing-Impaired Users",
        description: "Vibration alerts for hearing-impaired users.",
        iconData: Icons.vibration_outlined,
      )
    ];
    List<FeatureModel> medicalFeatures = [
      FeatureModel(
        title: "Heartbeat Measurement",
        description: "Monitor your loved ones' heart rate in real-time.",
        iconData: Icons.favorite_border_outlined,
      ),
      FeatureModel(
        title: "Medicine Schedule Alerts",
        description: "Receive reminders for medication.",
        iconData: Icons.schedule_outlined,
      ),
    ];

    final PageController pageController = PageController(
      viewportFraction:
          0.65, // Increased to make the active card take more space
      initialPage: 0, // Start at the first page
    );
    final PageController medicalPageController = PageController(
      viewportFraction: 0.65, // Increased for the same reason
      initialPage: 0, // Start at the first page
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.03,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.height * 0.01,
              ),
              ProfileAndSearch(),
              SizedBox(
                height: SizeConfig.height * 0.02,
              ),
              ImageWithTitle(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.featured_play_list_outlined,
                        color: AppColors.kThirdColor.withOpacity(0.8),
                        size: SizeConfig.width * 0.07,
                      ),
                      SizedBox(
                        width: SizeConfig.width * 0.02,
                      ),
                      Text(
                        "Features",
                        style: AppTextStyles.title24FourthColorW500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.23,
                    child: PageView.builder(
                      itemCount: features.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: pageController,
                          builder: (context, child) {
                            double scale = 0.8;
                            if (pageController.position.haveDimensions) {
                              double diff =
                                  (pageController.page! - index).abs();
                              scale = 1.0 - (diff.clamp(0.0, 1.0) * 0.2);
                            } else if (index == 0) {
                              // Ensure the first card starts as the largest
                              scale = 1.0;
                            }
                            return Transform.scale(
                              scale: scale,
                              child: Card(
                                color: AppColors.kThirdColor.withOpacity(0.8),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.height * 0.01,
                                    horizontal: SizeConfig.width * 0.03,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        features[index].title,
                                        style: AppTextStyles.title20WhiteBold,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        features[index].description,
                                        style: AppTextStyles.title16White500,
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                        features[index].iconData,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.01,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: features.length,
                    effect: SwapEffect(
                      dotHeight: SizeConfig.height * 0.01,
                      dotWidth: SizeConfig.width * 0.1,
                      activeDotColor: AppColors.kThirdColor.withOpacity(0.8),
                      dotColor: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: Divider(
                  color: AppColors.kThirdColor.withOpacity(0.8),
                  thickness: 2,
                  height: SizeConfig.height * 0.03,
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                        color: AppColors.kThirdColor.withOpacity(0.8),
                        size: SizeConfig.width * 0.07,
                      ),
                      SizedBox(
                        width: SizeConfig.width * 0.02,
                      ),
                      Text(
                        "Medical Features",
                        style: AppTextStyles.title24FourthColorW500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.23,
                    child: PageView.builder(
                      itemCount: medicalFeatures.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      controller: medicalPageController,
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: medicalPageController,
                          builder: (context, child) {
                            double scale = 0.8;
                            if (medicalPageController.position.haveDimensions) {
                              double diff =
                                  (medicalPageController.page! - index).abs();
                              scale = 1.0 - (diff.clamp(0.0, 1.0) * 0.2);
                            } else if (index == 0) {
                              // Ensure the first card starts as the largest
                              scale = 1.0;
                            }
                            return Transform.scale(
                              scale: scale,
                              child: Card(
                                color: AppColors.kThirdColor.withOpacity(0.8),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.height * 0.01,
                                    horizontal: SizeConfig.width * 0.03,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        medicalFeatures[index].title,
                                        style: AppTextStyles.title20WhiteBold,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        medicalFeatures[index].description,
                                        style: AppTextStyles.title16White500,
                                        textAlign: TextAlign.center,
                                      ),
                                      Icon(
                                        medicalFeatures[index].iconData,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.height * 0.01,
                  ),
                  SmoothPageIndicator(
                    controller: medicalPageController,
                    count: medicalFeatures.length,
                    effect: SwapEffect(
                      dotHeight: SizeConfig.height * 0.01,
                      dotWidth: SizeConfig.width * 0.1,
                      activeDotColor: AppColors.kThirdColor.withOpacity(0.8),
                      dotColor: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: Divider(
                  color: AppColors.kThirdColor.withOpacity(0.8),
                  thickness: 2,
                  height: SizeConfig.height * 0.03,
                ),
              ),
              SizedBox(
                height: SizeConfig.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_outlined,
                    color: AppColors.kThirdColor.withOpacity(0.8),
                    size: SizeConfig.width * 0.07,
                  ),
                  Text(
                    "Our Product",
                    style: AppTextStyles.title24FourthColorW500,
                  ),
                ],
              ),
              Image.asset(
                AppImages.blueWatchImage,
                height: SizeConfig.height * 0.3,
              ),
              CustomGradiantButtonWithIcon(
                title: "Buy Now!",
                onPressed: () {
                  context.pushScreen(RouteNames.buyWatchScreen);
                },
                height: SizeConfig.height * 0.06,
              ),
              SizedBox(
                width: SizeConfig.width * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: Divider(
                  color: AppColors.kThirdColor.withOpacity(0.8),
                  thickness: 2,
                  height: SizeConfig.height * 0.03,
                ),
              ),
              About(),
              SizedBox(
                height: SizeConfig.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              color: AppColors.kThirdColor.withOpacity(0.8),
              size: SizeConfig.width * 0.07,
            ),
            SizedBox(
              width: SizeConfig.width * 0.02,
            ),
            Text(
              "About",
              style: AppTextStyles.title24FourthColorW500,
            ),
          ],
        ),
        Card(
          color: AppColors.kThirdColor.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
                color: AppColors.kThirdColor.withOpacity(0.8), width: 1.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height * 0.01,
              horizontal: SizeConfig.width * 0.02,
            ),
            child: Text(
              "At Safe Steps, we are dedicated to enriching the lives of working adults, elderly individuals, and people with special needs, such as those with Down syndrome. Our mission is to provide peace of mind & security by creating innovative, reliable, and user-friendly wearable devices that ensure the safety of their loved ones, no matter where they go.",
              style: AppTextStyles.title16White500,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileAndSearch extends StatelessWidget {
  const ProfileAndSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade200,
          ),
          child: CustomIconButton(
            icon: Icons.person,
            onPressed: () async {

            },
            iconSize: SizeConfig.width * 0.09,
            iconColor: AppColors.kThirdColor.withOpacity(0.8),
          ),
        ),
        SizedBox(
          width: SizeConfig.width * 0.02,
        ),
        Expanded(
          child: CustomTextFormField(
            hintText: "Search Here",
            fillColor: Colors.grey.shade200,
            prefixIcon: Icons.search,
          ),
        )
      ],
    );
  }
}

class ImageWithTitle extends StatelessWidget {
  const ImageWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: SizeConfig.height * 0.27,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.homeImage,
            ),
          ),
        ),
        child: Center(
          child: Text(
            "Empowering Freedom, Ensuring Safety",
            style: AppTextStyles.title28WhiteColorWithOpacity,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
