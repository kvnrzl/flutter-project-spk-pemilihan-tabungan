const homePageDisplayName = "Beranda";
const homePageRoute = "/home";

const alternativePageDisplayName = "Daftar Tabungan";
const alternativePageRoute = "/alternative";

const recomendationPageDisplayName = "Rekomendasi";
const recomendationPageRoute = "/recomendation";

const presetPageDisplayName = "Preset Bobot";
const presetPageRoute = "/preset";

class MenuItems {
  String name;
  String route;

  MenuItems({required this.name, required this.route});
}

List sideMenuItems = [
  MenuItems(name: homePageDisplayName, route: homePageRoute),
  MenuItems(name: alternativePageDisplayName, route: alternativePageRoute),
  MenuItems(name: recomendationPageDisplayName, route: recomendationPageRoute),
  MenuItems(name: presetPageDisplayName, route: presetPageRoute),
];
