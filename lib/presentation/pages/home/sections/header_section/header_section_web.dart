import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app_theme.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/presentation/widgets/buttons/custom_button.dart';
import 'package:portfolio/presentation/widgets/content_area.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/app_images.dart';
import 'package:portfolio/values/values.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'widgets.dart';

const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;
// const double sidePadding = Sizes.PADDING_16;

class HeaderSectionWeb extends StatefulWidget {
  const HeaderSectionWeb({super.key});

  @override
  _HeaderSectionWebState createState() => _HeaderSectionWebState();
}

class _HeaderSectionWebState extends State<HeaderSectionWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_24,
      Sizes.TEXT_SIZE_56,
      md: Sizes.TEXT_SIZE_36,
    );
    double bodyTextSize =
        responsiveSize(context, bodyTextSizeSm, bodyTextSizeLg);
    double socialTextSize =
        responsiveSize(context, socialTextSizeSm, socialTextSizeLg);
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth;
    TextStyle? bodyTextStyle =
        textTheme.bodyLarge?.copyWith(fontSize: bodyTextSize);
    TextStyle? socialTitleStyle =
        textTheme.titleMedium?.copyWith(fontSize: socialTextSize);

    List<Widget> cardsForTabletView = buildCardRow(
      context: context,
      data: Data.customCardData,
      width: contentAreaWidth * 0.4,
      isWrap: true,
    );
    double buttonWidth = responsiveSize(
      context,
      80,
      150,
    );
    double buttonHeight = responsiveSize(
      context,
      48,
      60,
      md: 54,
    );

    double sizeOfBlobSm = screenWidth * 0.3;
    double sizeOfGoldenGlobe = screenWidth * 0.2;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;
    double blobOffset = heightOfStack * 0.3;
    return ContentArea(
      child: Stack(
        children: [
          SizedBox(
            height: heightOfStack,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: -(sizeOfBlobSm * 0.7),
                      top: blobOffset,
                      child: Image.asset(
                        AppImage.BLOB_BLACK,
                        height: sizeOfBlobSm,
                        width: sizeOfBlobSm,
                      ),
                    ),
                    Positioned(
                      left: -(sizeOfGoldenGlobe * 0.5),
                      top: blobOffset + dottedGoldenGlobeOffset,
                      child: RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          AppImage.DOTS_GLOBE_YELLOW,
                          width: sizeOfGoldenGlobe,
                          height: sizeOfGoldenGlobe,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: -(sizeOfBlobSm * 0.8),
                  child: HeaderImage(
                    controller: _controller,
                    globeSize: sizeOfGoldenGlobe,
                    imageHeight: heightOfStack,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: heightOfStack * 0.05),
                    child: SelectableText(
                      AppConst.firstName,
                      // style: textTheme.displayLarge?.copyWith(
                      //   color: AppColors.grey50,
                      //   fontSize: headerIntroTextSize * 2,

                      // ),
                      style: AppTheme.fontGloriaHallelujah.copyWith(
                        fontSize: headerIntroTextSize * 2,
                        color: AppColors.grey50,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: heightOfStack * 0.2, left: (sizeOfBlobSm * 0.35)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    AppConst.intro,
                                    speed: const Duration(milliseconds: 60),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                    ),
                                  ),
                                ],
                                onTap: () {},
                                isRepeatingAnimation: true,
                                totalRepeatCount: 5,
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    AppConst.position1,
                                    speed: const Duration(milliseconds: 80),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                      color: AppColors.primaryColor,
                                      height: 1.2,
                                    ),
                                  ),
                                  TypewriterAnimatedText(
                                    AppConst.position2,
                                    speed: const Duration(milliseconds: 80),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                      color: AppColors.primaryColor,
                                      height: 1.2,
                                    ),
                                  ),
                                  TypewriterAnimatedText(
                                    AppConst.position3,
                                    speed: const Duration(milliseconds: 80),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                      color: AppColors.primaryColor,
                                      height: 1.2,
                                    ),
                                  ),
                                  TypewriterAnimatedText(
                                    AppConst.position4,
                                    speed: const Duration(milliseconds: 80),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                      color: AppColors.primaryColor,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                                onTap: () {},
                                isRepeatingAnimation: true,
                                totalRepeatCount: 5,
                              ),
                            ),
                            const SpaceH16(),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth * 0.35),
                              child: SelectableText(
                                AppConst.ABOUT_DEV,
                                style: bodyTextStyle?.copyWith(height: 1.5),
                              ),
                            ),
                            const SpaceH30(),
                            Wrap(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      "${AppConst.email}:",
                                      style: socialTitleStyle,
                                    ),
                                    const SpaceH8(),
                                    SelectableText(
                                      AppConst.devEmail,
                                      style: bodyTextStyle,
                                    ),
                                  ],
                                ),
                                const SpaceW16(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      "${AppConst.github}:",
                                      style: socialTitleStyle,
                                    ),
                                    const SpaceH8(),
                                    SelectableText(
                                      AppConst.githubId,
                                      style: bodyTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SpaceH40(),
                            Row(
                              children: [
                                CustomButton(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: AppConst.DOWNLOAD_CV,
                                  buttonColor: AppColors.primaryColor,
                                  onPressed: () {},
                                  titleColor: AppColors.black,
                                ),
                                const SpaceW16(),
                                CustomButton(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: AppConst.hireMeNow,
                                  opensUrl: true,
                                  url: AppConst.emailUrl,
                                  // onPressed: () =>
                                  //     openUrlLink(AppConst.EMAIL_URL),
                                ),
                              ],
                            ),
                            const SpaceH30(),
                            Wrap(
                              children: buildSocialIcons(Data.socialData),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              Container(
                margin: EdgeInsets.only(left: (sizeOfBlobSm * 0.35)),
                child: ResponsiveBuilder(
                  refinedBreakpoints: const RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < const RefinedBreakpoints().tabletNormal) {
                      return Container(
                        margin: EdgeInsets.only(right: (sizeOfBlobSm * 0.35)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildCardRow(
                            context: context,
                            data: Data.customCardData,
                            width: contentAreaWidth,
                            isHorizontal: false,
                            hasAnimation: false,
                          ),
                        ),
                      );
                    } else if (screenWidth >=
                            const RefinedBreakpoints().tabletNormal &&
                        screenWidth <= 1024) {
                      return Wrap(
                        runSpacing: 24,
                        children: [
                          SizedBox(width: contentAreaWidth * 0.03),
                          cardsForTabletView[0],
                          const SpaceW40(),
                          cardsForTabletView[1],
                          SizedBox(width: contentAreaWidth * 0.03),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: cardsForTabletView[2],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ...buildCardRow(
                                context: context,
                                data: Data.customCardData,
                                width: contentAreaWidth / 3.8,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
