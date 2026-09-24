#import "@preview/datify:1.3.0": display-date

#let webProfile(domain, name, path: "") = [
  https:\/\/#text(domain, weight: "bold")/#path#text(name, style: "italic")
]

#let fonts = (
  serif: "Iowan Old Style",
  sans: "Avenir Next",
)

#let colors = (
  body: black,
  neutral: rgb("#666666"),
  accent: rgb("#1f6fb2")
)

#let presection-space = 2em

#let month-format = "MMM yyyy"
#let year-format = "yyyy"

#let cv(
  name: [],
  tagline: [],
  contact: [],
  profile: [],
  education: (),
  languages: (),
  hobbies: (),
  skills: (),
  jobs: (),
) = {
  set page(paper: "a4", margin: (x:1.8cm, y: 1.3cm))
  set text(font: fonts.serif, size: 9.1pt)
  set par(justify: true, leading: 0.48em)

  show title : set text(size: 23pt)
  show heading.where(level: 1) : set text(
    font: fonts.sans,
    fill: colors.accent,
    size: 10pt,
    tracking: -0.3pt,
  )
  show heading.where(level: 1): it => [
    #v(presection-space)
    #it.body
  ]

  grid(
    columns: (2fr, 1fr),
    column-gutter: 3em,
    [
      #title(name)
      #text(tagline, font: fonts.sans, size: 11pt)

      #v(presection-space)
      #profile

      = Professional Experience

      #for job in jobs [
        #set par(spacing: 0.8em, leading: 0.1em)
        == #job.title#h(1fr)#text(font: fonts.sans, size: 8pt, fill: colors.neutral, weight: "regular")[
          #upper[
            #display-date(job.from, pattern: month-format) ---
            #if job.to == none { "Present" } else { display-date(job.to, pattern: month-format) }
          ]
        ]

        #if "company" in job and "place" in job [
          #v(-0.5em)
          #text(size: 10pt)[
            #set par(justify: false)
            #set text(fill: colors.neutral)
            #box[#text(job.company, style: "italic"),] #box[#job.place]
          ]

          #set par(leading: 0.1em, spacing: 0.8em)
          #for item in job.at("items", default: ()) [
            #par(item)
          ]
        ] else [
          // For multiple sequential job titles at the same company,
          // which are then displayed as a group
          #v(-1.2em)
        ]
      ]

    ],
    [
      #set align(right)
      #par[
        #set text(size: 8pt, font: fonts.sans)
        #contact
      ]

      #set align(left)
      #set par(justify: false, spacing: 1.2em)

      = Education

      #for item in education [
        #set text(fill: colors.neutral)
        #text(weight: "bold", fill: colors.body)[#item.title]
        #h(1fr)
        #display-date(item.from, pattern: year-format)--#display-date(item.to, pattern: year-format)
        \
        #text(item.institution, style: "italic")

      ]

      = Languages

      #for item in languages [
        #text(item.language, weight: "bold"), #item.level \
      ]

      = Skills

      #for section in skills [
        #show heading.where(level: 2) : set text(size: 9pt, font: fonts.sans, fill: colors.neutral, weight: "regular")
        #show heading.where(level: 2) : it => [ #v(0.3em)#it.body ]
        == #section.category \
        #for item in section.items [
          #box(item)#h(1em)
        ]
      ]

      = Hobbies

      #for hobby in hobbies [
        #set text(fill: colors.neutral)
        #hobby \
      ]
    ]
  )

}
