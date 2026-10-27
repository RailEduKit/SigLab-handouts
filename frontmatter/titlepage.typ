#import "../config.typ":*

#context{
let logo-setting = image("../images/logo.svg")
let logo-size = measure(logo-setting)

set page(background:
    [
      #place(
        center+horizon,
        dy: - logo-size.height, // The gap between text and logo is 2/6 of the logo height 
        text(font: font-sans, weight: "bold", size: 32pt)[Interactive Signalling Laboratory]
      )
      #place(
        center+horizon,
        dy: - (1/6) * logo-size.height, //The logo is placed 4/6 above the horizon and 2/6 beneath the horizon
        logo-setting
      )
      #place(
        center+horizon,
        dy: (4/6) * logo-size.height, // 2/6 of the logo lies beneath the horizon and 2/6 logo height is needed as gap
        text()[“Spielen ist eine Tätigkeit, die man garnicht ernst genug nehmen kann!”]
      )
      #place(
        right+horizon,
        dy: (4/6) * logo-size.height + 25pt,
        dx: -30mm,
        text(style: "italic")[Jacques-Yves Cousteau]
      )
    ]
)

}
