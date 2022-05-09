class ProjectModel {
  String title;
  String subTitle;
  String discription;
  String imageUrl;
  String projectUrl;

  ProjectModel({
    required this.title,
    required this.subTitle,
    required this.discription,
    required this.imageUrl,
    required this.projectUrl,
  });
}

final List<ProjectModel> projectList = [
  ProjectModel(
    title: "firts projetc",
    subTitle: "discjdf hfj",
    discription:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea......",
    imageUrl:
        "https://images.unsplash.com/photo-1636794756058-957d555a9cd6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    projectUrl: "https://shahnajjamil.github.io",
  ),
  ProjectModel(
    title: "second projetc",
    subTitle: "discjdf hfj",
    discription:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea......",
    imageUrl:
        "https://images.unsplash.com/photo-1636794756058-957d555a9cd6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    projectUrl: "https://shahnajjamil.github.io",
  ),
];
