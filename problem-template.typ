#let theme-color = rgb("#0879e4")
#let theme-light-color = theme-color.lighten(40%)
#let theme-dark-color = theme-color.darken(30%)
#let theme-gray-color = rgb("#444")

#let template(doc) = [
  #set text(font: "Noto Serif CJK SC")
  #set raw(tab-size: 4)
  #show raw: it => {
    set text(font: ("JetBrainsMono NFM", "Source Han Sans"))
    if it.text.contains("\n") {
      block(
        it,
        stroke: theme-dark-color,
        inset: .7em,
        radius: .3em,
        width: 100%
      )
    }
    else {
      box(
        it,
        stroke: theme-dark-color,
        inset: .3em,
        radius: .3em,
      )
    }
  }


  #set page(
    footer: [
      #text(size: 7pt, fill: black.opacify(-70%))[
        #align(center)[
          #show link: it => text(fill: blue.opacify(-50%), underline(offset: 2pt, it))
          本文内容采用 #link("https://creativecommons.org/licenses/by-nc-sa/4.0/")[CC BY-NC-SA 4.0] 许可协议进行许可\
          作者: #link("https://github.com/QuestionMarky")[QuestionMarky]
        ]
      ]
    ]
  )

  #show heading: it => {
    stack(
      align(if it.level == 1 { center } else { left + top })[
        #text(it, fill: theme-color)
      ],
      v(0.3em),
      line(length: 100%, stroke: theme-color + 0.06em),
      v(0.5em),
    )
  }

  #doc
]