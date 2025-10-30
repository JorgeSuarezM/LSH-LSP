var configuration = [
      {
        config: "LSH",
        imgConfig: "img/photos/LSHsat.png",
      },
      {
        config: "LSP",
        imgConfig: "img/photos/LSPsat.png",
      },
    ];

var structure = [
  {str: "Muchos árboles, con hierba y arbustos", imgStr: "img/photos/structure1.png"}, 
  {str: "Árboles diseminados, con hierba y arbustos", imgStr: "img/photos/structure2.png"}, 
  {str: "Algunos árboles, con hierba y arbustos", imgStr: "img/photos/structure3.png"}, 
  {str: "Sin árboles, solo hierba y arbustos", imgStr: "img/photos/structure4.png"}, 
  {str: "Solo hierba, sin árboles ni arbustos", imgStr: "img/photos/structure5.png"},
];

var pruning = [
  {prune: "Hierba y arbustos sin podar", imgPrune: "img/photos/pruning1.png"},
  {prune: "Hierba y arbustos podados parcialmente", imgPrune: "img/photos/pruning2.png"},
  {prune: "Hierba y arbustos podados completamente", imgPrune: "img/photos/pruning3.png"},
];

var time = [
  {t: "Enfrente de casa"},
  {t: "Menos de 5 minutos"}, 
  {t: "De 5 a 10 minutos"}, 
  {t: "De 10 a 20 minutos"}, 
  {t: "20 minutos o más"}
];

const combinations = configuration.flatMap(cfg =>
    structure.flatMap(str =>
        pruning.flatMap(prune =>
            time.map(t => ({
                config: cfg.config,
                imgConfig: cfg.imgConfig,
                structure: str.str,
                imgStr: str.imgStr,
                pruning: prune.prune,
                imgPrune: prune.imgPrune,
                time: t.t
            }))
        )
    )
);

const combinationsLSH = combinations.filter(c => c.config === "LSH");
const combinationsLSP = combinations.filter(c => c.config === "LSP");