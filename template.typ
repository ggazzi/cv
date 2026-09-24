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

#let l8n = (
  datetime: (
    present: (
      de: "aktuell",
      en: "Present",
    )
  ),
  headings: (
    professional-experience: (
      en: "Professional Experience",
      de: "Berufserfahrung",
    ),
    education: (
      en: "Education",
      de: "Ausbildung",
    ),
    languages: (
      en: "Languages",
      de: "Sprachen",
    ),
    skills: (
      en: "Skills",
      de: "Kenntnisse & Fähigkeiten",
    ),
    hobbies: (
      en: "Hobbies & Interests",
      de: "Hobbies & Interessen",
    ),
  ),
  languages: (
    en: (
      en: "English",
      de: "Englisch",
    ),
    de: (
      en: "German",
      de: "Deutsch",
    ),
    pt: (
      en: "Portuguese",
      de: "Portugiesisch",
    ),
    es: (
      en: "Spanish",
      de: "Spanisch",
    ),
  ),
  languageLevels: (
    native: (
      en: "native",
      de: "muttersprachler",
    ),
    fluent: (
      en: "fluent",
      de: "verhandlungssicher",
    ),
    conversational: (
      en: "conversational",
      de: "gute Kenntnisse",
    )
  )
)

#let localized(value, lang: none) = context {
  if type(value) == dictionary {
    value.at(
      if lang == none { text.lang } else { lang }
    )
  } else {
    value
  }
}

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
      #text(localized(tagline), font: fonts.sans, size: 11pt)

      #v(presection-space)
      #localized(profile)

      = #localized(l8n.headings.professional-experience)

      #for job in jobs [
        #set par(spacing: 0.8em, leading: 0.1em)
        == #localized(job.title) #h(1fr)#text(font: fonts.sans, size: 8pt, fill: colors.neutral, weight: "regular")[
          #upper[
            #display-date(job.from, pattern: month-format) ---
            #if job.to == none { localized(l8n.datetime.present) } else { display-date(job.to, pattern: month-format) }
          ]
        ]

        #if "company" in job and "place" in job [
          #v(-0.5em)
          #text(size: 10pt)[
            #set par(justify: false)
            #set text(fill: colors.neutral)
            #box[#text(job.company, style: "italic"),] #box[#localized(job.place)]
          ]

          #set par(leading: 0.1em, spacing: 0.8em)
          #for item in job.at("items", default: ()) [
            #par(localized(item))
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

      = #localized(l8n.headings.education)

      #for item in education [
        #set text(fill: colors.neutral)
        #text(weight: "bold", fill: colors.body)[#localized(item.title)]
        #h(1fr)
        #display-date(item.from, pattern: year-format)--#display-date(item.to, pattern: year-format)
        \
        #text(localized(item.institution), style: "italic")

      ]

      = #localized(l8n.headings.languages)

      #for item in languages [
        #text(localized(l8n.languages.at(item.language)), weight: "bold"),
        #localized(l8n.languageLevels.at(item.level)) \
      ]

      = #localized(l8n.headings.skills)

      #for section in skills [
        #show heading.where(level: 2) : set text(size: 9pt, font: fonts.sans, fill: colors.neutral, weight: "regular")
        #show heading.where(level: 2) : it => [ #v(0.3em)#it.body ]
        == #localized(section.category) \
        #for item in section.items [
          #box(localized(item))#h(1em)
        ]
      ]

      = #localized(l8n.headings.hobbies)

      #for hobby in hobbies [
        #set text(fill: colors.neutral)
        #localized(hobby) \
      ]
    ]
  )

}
