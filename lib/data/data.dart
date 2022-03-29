
class Product {
  final String name;
  final int base;
  final String label;
  final String type;
  Product({
    required this.name,
    required this.base,
    required this.label,
    required this.type,
  });
}

List<Product> loadProduct() {
  var products = <Product>[
    Product(
      name: "MakaGrycz",
      base: 140,
      label: "Mąka gryczana",
      type: "Mąki",
    ),
    Product(
      name: "MakaJag",
      base: 150,
      label: "Mąka jaglana",
      type: "Mąki",
    ),
    Product(
      name: "MakaJecz",
      base: 110,
      label: "Mąka jęczmnienna",
      type: "Mąki",
    ),
    Product(
      name: "MakaKrup",
      base: 210,
      label: "Mąka krupczatka",
      type: "Mąki",
    ),
    Product(
      name: "MakaKuk",
      base: 150,
      label: "Mąka kukurydziana",
      type: "Mąki",
    ),
    Product(
      name: "Maka2000o",
      base: 150,
      label: "Mąka orkiszowa razowa (2000)",
      type: "Mąki",
    ),
    Product(
      name: "Maka750o",
      base: 150,
      label: "Mąka orkiszowa razowa (750)",
      type: "Mąki",
    ),
    Product(
      name: "Makaows",
      base: 140,
      label: "Mąka owsiana",
      type: "Mąki",
    ),
    Product(
      name: "Maka550",
      base: 160,
      label: "Mąka pszenna (typ 550)",
      type: "Mąki",
    ),
    Product(
      name: "Maka2000p",
      base: 145,
      label: "Mąka pszenna razowa (2000)",
      type: "Mąki",
    ),
    Product(
      name: "Maka750p",
      base: 150,
      label: "Mąka pszenna chlebowa (750)",
      type: "Mąki",
    ),
    Product(
      name: "MakaJag",
      base: 160,
      label: "Mąka ryżowa",
      type: "Mąki",
    ),
    Product(
      name: "MakaZiem",
      base: 200,
      label: "Mąka ziemniaczana",
      type: "Mąki",
    ),
    Product(
      name: "Maka2000z",
      base: 120,
      label: "Mąka żytnia razowa (2000)",
      type: "Mąki",
    ),
    Product(
      name: "Kwaschlebowy",
      base: 220,
      label: "Kwas chlebowy",
      type: "Napoje",
    ),
    Product(
      name: "Woda",
      base: 250,
      label: "Woda",
      type: "Napoje",
    ),
    Product(
      name: "Maslo",
      base: 320,
      label: "Masło / Margaryna",
      type: "Tłuszcze",
    ),
    Product(
      name: "Olejl",
      base: 105,
      label: "Olej lniany",
      type: "Tłuszcze",
    ),
    Product(
      name: "Olejr",
      base: 215,
      label: "Olej rzepakowy",
      type: "Tłuszcze",
    ),
    Product(
      name: "Olejs",
      base: 215,
      label: "Olej słonecznikowy",
      type: "Tłuszcze",
    ),
    Product(
      name: "Olejpw",
      base: 220,
      label: "Olej z pestek winogron",
      type: "Tłuszcze",
    ),
    Product(
      name: "Miod",
      base: 360,
      label: "Miód",
      type: "Produkty",
    ),
    Product(
      name: "Smiet18",
      base: 230,
      label: "Śmietana 18%",
      type: "Nabiał",
    ),
    Product(
      name: "Smiet30",
      base: 260,
      label: "Śmietana 30%",
      type: "Nabiał",
    ),
    Product(
      name: "Cukierb",
      base: 220,
      label: "Cukier biały",
      type: "Dodatki",
    ),
    Product(
      name: "Cukiert",
      base: 230,
      label: "Cukier trzcinowy",
      type: "Dodatki",
    ),
    Product(
      name: "Cukierp",
      base: 180,
      label: "Cukier puder",
      type: "Dodatki",
    ),
    Product(
      name: "Kakao",
      base: 130,
      label: "Kakao",
      type: "Dodatki",
    ),
    Product(
      name: "Mak",
      base: 160,
      label: "Mak",
      type: "Dodatki",
    ),
    Product(
      name: "Sezam",
      base: 150,
      label: "Sezam",
      type: "Dodatki",
    ),
    Product(
      name: "Sol",
      base: 300,
      label: "Sól",
      type: "Dodatki",
    ),
    Product(
      name: "Serwatka",
      base: 300,
      label: "Serwatka w proszku",
      type: "Dodatki",
    ),
    Product(
      name: "Migdal",
      base: 240,
      label: "Migdał",
      type: "Bakalie",
    ),
    Product(
      name: "Orzechz",
      base: 240,
      label: "Orzeszki ziemne",
      type: "Bakalie",
    ),
    Product(
      name: "Orzechw",
      base: 180,
      label: "Orzeszki włoskie",
      type: "Bakalie",
    ),
    Product(
      name: "Platekm",
      base: 170,
      label: "Płatki migdałowych",
      type: "Bakalie",
    ),
    Product(
      name: "Wiorkikokos",
      base: 170,
      label: "Wiórki kokosowych",
      type: "Bakalie",
    ),
    Product(
      name: "Btarta",
      base: 150,
      label: "Bułka tarta",
      type: "Zboża",
    ),
    Product(
      name: "Makaronf",
      base: 80,
      label: "Makaron Filini surow.",
      type: "Zboża",
    ),
    Product(
      name: "Makaronfu",
      base: 140,
      label: "Makaron Filini ugot.",
      type: "Zboża",
    ),
    Product(
      name: "Makaronr",
      base: 70,
      label: "Makaron Penne surow.",
      type: "Zboża",
    ),
    Product(
      name: "Makaronru",
      base: 110,
      label: "Makaron Penne ugot.",
      type: "Zboża",
    ),
    Product(
      name: "Makaronsu",
      base: 120,
      label: "Makaron Spaghetti ugot.",
      type: "Zboża",
    ),
    Product(
      name: "Otreby",
      base: 105,
      label: "Otręby",
      type: "Zboża",
    ),
    Product(
      name: "Ryz",
      base: 225,
      label: "Ryż",
      type: "Zboża",
    ),
    Product(
      name: "Drozdze",
      base: 190,
      label: "Drożdże",
      type: "Grzyby",
    ),
  ];
  return products;
}