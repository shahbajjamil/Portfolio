part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: AppConst.youtubeURL,
      iconData: FontAwesomeIcons.youtube,
      url: AppConst.youtubeURL,
    ),
    SocialButtonData(
      tag: AppConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: AppConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: AppConst.githubURL,
      iconData: FontAwesomeIcons.github,
      url: AppConst.githubURL,
    ),
    SocialButtonData(
      tag: AppConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: AppConst.INSTAGRAM_URL,
    ),
    // SocialButtonData(
    //   tag: AppConst.FACEBOOK_URL,
    //   iconData: FontAwesomeIcons.facebook,
    //   url: AppConst.FACEBOOK_URL,
    // ),
  ];

  static List<SocialButton2Data> socialData2 = [
    // SocialButton2Data(
    //   title: AppConst.BEHANCE,
    //   iconData: FontAwesomeIcons.behance,
    //   url: AppConst.BEHANCE_URL,
    //   titleColor: AppColors.blue300,
    //   buttonColor: AppColors.blue300,
    //   iconColor: AppColors.white,
    // ),
    // SocialButton2Data(
    //   title: AppConst.DRIBBLE,
    //   iconData: FontAwesomeIcons.dribbble,
    //   url: AppConst.DRIBBLE_URL,
    //   titleColor: AppColors.pink300,
    //   buttonColor: AppColors.pink300,
    //   iconColor: AppColors.white,
    // ),
    SocialButton2Data(
      title: AppConst.INSTA,
      iconData: FontAwesomeIcons.instagram,
      url: AppConst.INSTAGRAM_URL,
      titleColor: AppColors.yellow300,
      buttonColor: AppColors.yellow300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: AppConst.github,
      iconData: FontAwesomeIcons.github,
      url: AppConst.githubURL,
      titleColor: AppColors.black,
      buttonColor: AppColors.grey250,
      iconColor: AppColors.black,
    ),
    SocialButton2Data(
      title: AppConst.linkedIn,
      iconData: FontAwesomeIcons.linkedin,
      url: AppConst.LINKED_IN_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: AppConst.youtube,
      iconData: FontAwesomeIcons.youtube,
      url: AppConst.youtubeURL,
      titleColor: AppColors.red,
      buttonColor: AppColors.red,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: AppConst.SKILLS_1,
      level: 90,
    ),
    SkillLevelData(
      skill: AppConst.SKILLS_2,
      level: 90,
    ),
    SkillLevelData(
      skill: AppConst.SKILLS_3,
      level: 45,
    ),
    SkillLevelData(
      skill: AppConst.SKILLS_4,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: AppConst.SKILLS_1,
      description: AppConst.SKILLS_1_DESC,
      iconData: FontAwesomeIcons.compress,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: AppConst.SKILLS_2,
      description: AppConst.SKILLS_2_DESC,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: AppConst.SKILLS_3,
      description: AppConst.SKILLS_3_DESC,
      iconData: FontAwesomeIcons.paintbrush,
    ),
    SkillCardData(
      title: AppConst.SKILLS_4,
      description: AppConst.SKILLS_4_DESC,
      iconData: FontAwesomeIcons.code,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 1030, subtitle: AppConst.YOUTUBE_SUB),
    StatItemData(value: 30, subtitle: AppConst.YOUTUBE_VIDEO),
    StatItemData(value: 4, subtitle: AppConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 5, subtitle: AppConst.INCREDIBLE_PROJECTS),
    // StatItemData(value: 18, subtitle: AppConst.AWARD_WINNING),
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(title: AppConst.ALL, number: 6, isSelected: true),
    ProjectCategoryData(title: AppConst.BRANDING, number: 1),
    ProjectCategoryData(title: AppConst.PACKAGING, number: 1),
    ProjectCategoryData(title: AppConst.PHOTOGRAPHY, number: 2),
    ProjectCategoryData(title: AppConst.WEB_DESIGN, number: 3),
  ];

  // static List<String> awards1 = [
  //   AppConst.AWARDS_1,
  //   AppConst.AWARDS_2,
  //   AppConst.AWARDS_3,
  //   AppConst.AWARDS_4,
  //   AppConst.AWARDS_5,
  // ];
  // static List<String> awards2 = [
  //   AppConst.AWARDS_6,
  //   AppConst.AWARDS_7,
  //   AppConst.AWARDS_8,
  //   AppConst.AWARDS_9,
  //   AppConst.AWARDS_10,
  // ];
  // static List<BlogCardData> blogData = [
  //   BlogCardData(
  //     category: AppConst.BLOG_CATEGORY_1,
  //     title: AppConst.BLOG_TITLE_1,
  //     date: AppConst.BLOG_DATE,
  //     buttonText: AppConst.READ_MORE,
  //     imageUrl: AppImage.BLOG_01,
  //   ),
  //   BlogCardData(
  //     category: AppConst.BLOG_CATEGORY_2,
  //     title: AppConst.BLOG_TITLE_2,
  //     date: AppConst.BLOG_DATE,
  //     buttonText: AppConst.READ_MORE,
  //     imageUrl: AppImage.BLOG_02,
  //   ),
  //   BlogCardData(
  //     category: AppConst.BLOG_CATEGORY_3,
  //     title: AppConst.BLOG_TITLE_3,
  //     date: AppConst.BLOG_DATE,
  //     buttonText: AppConst.READ_MORE,
  //     imageUrl: AppImage.BLOG_03,
  //   ),
  // ];

  static List<CustomCardData> customCardData = [
    CustomCardData(
      title: AppConst.appDev,
      subtitle: AppConst.appDevDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    CustomCardData(
      title: AppConst.backendDev,
      subtitle: AppConst.backendDevDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    CustomCardData(
      title: AppConst.freelancer,
      subtitle: AppConst.freelancerDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  static List<ProjectData> allProjects = [
    ProjectData(
      title: AppConst.PORTFOLIO_1_TITLE,
      category: AppConst.PHOTOGRAPHY,
      projectCoverUrl: AppImage.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_2_TITLE,
      category: AppConst.WEB_DESIGN,
      projectCoverUrl: AppImage.PORTFOLIO_2,
      width: 0.225,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_3_TITLE,
      category: AppConst.BRANDING,
      projectCoverUrl: AppImage.PORTFOLIO_3,
      width: 0.225,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_4_TITLE,
      category: AppConst.WEB_DESIGN,
      projectCoverUrl: AppImage.PORTFOLIO_4,
      width: 0.2375,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_5_TITLE,
      category: AppConst.PACKAGING,
      projectCoverUrl: AppImage.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_6_TITLE,
      category: AppConst.PHOTOGRAPHY,
      projectCoverUrl: AppImage.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> branding = [
    ProjectData(
      title: AppConst.PORTFOLIO_3_TITLE,
      category: AppConst.BRANDING,
      projectCoverUrl: AppImage.PORTFOLIO_3,
      width: 0.225,
    ),
  ];
  static List<ProjectData> packaging = [
    ProjectData(
      title: AppConst.PORTFOLIO_5_TITLE,
      category: AppConst.PACKAGING,
      projectCoverUrl: AppImage.PORTFOLIO_5,
      width: 0.2375,
    ),
  ];
  static List<ProjectData> photograhy = [
    ProjectData(
      title: AppConst.PORTFOLIO_1_TITLE,
      category: AppConst.PHOTOGRAPHY,
      projectCoverUrl: AppImage.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_6_TITLE,
      category: AppConst.PHOTOGRAPHY,
      projectCoverUrl: AppImage.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> webDesign = [
    ProjectData(
      title: AppConst.PORTFOLIO_2_TITLE,
      category: AppConst.WEB_DESIGN,
      projectCoverUrl: AppImage.PORTFOLIO_2,
      width: 0.225,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_4_TITLE,
      category: AppConst.WEB_DESIGN,
      projectCoverUrl: AppImage.PORTFOLIO_4,
      width: 0.2375,
    ),
    ProjectData(
      title: AppConst.PORTFOLIO_5_TITLE,
      category: AppConst.PACKAGING,
      projectCoverUrl: AppImage.PORTFOLIO_5,
      width: 0.2375,
    ),
  ];
}
