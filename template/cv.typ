#import "@preview/datify:1.3.0": display-date

#let webProfile(domain, name, path: "") = [
  #link("https://" + domain + "/" + path + name)[#text(domain, weight: "bold")/#path#text(name, style: "italic")]
]

// Typography rules, one meaning per device:
//   all-caps + positive tracking -> section heading (level 1 only)
//   italic                       -> organisation name (company, institution, web handle)
//   bold                         -> key scannable term of its line (job title, degree, language)
//   bold, in the contact block   -> "reachable here" (phone, email; not the postal address)
//   colors.neutral               -> metadata only (dates, category labels)
//   colors.accent                -> structure and positioning (section headings, tagline)
// Sizes: name / title / body / label, plus sublabel for the skills categories,
// which are caps like the section headings and so must differ on size, weight
// and tracking to stay subordinate to them.
#let fonts = (
  serif: "Spectral",
  sans: "Schibsted Grotesk",
)

#let sizes = (
  name: 23pt,
  title: 11pt,
  body: 9.5pt,
  label: 8pt,
  sublabel: 7.2pt,
)

#let colors = (
  body: black,
  neutral: rgb("#666666"),
  accent: rgb("#2563a8")
)

// Vertical rhythm. Each level is at least 1.6x the one below it, so a gap
// always reads as a boundary rather than as a slightly larger line gap.
// The two columns run the same scale at two measures: the sidebar is a third
// as wide, so its lines need less leading and its shorter blocks sit closer
// together. Each column's steps are set from its own dictionary, and the ratio
// between consecutive levels holds within each.
#let spacing-main = (
  line: 5.3pt,
  item: 10pt,    // 1.9x line
  job: 17pt,     // 1.7x item
  section: 28pt, // 1.6x job
)

#let spacing-sidebar = (
  line: 4.3pt,
  item: 11pt,    // 2.6x line
  section: 19pt, // 1.7x item
)

#let month-format = "MMM yyyy"
#let year-format = "yyyy"

#let l8n = (
  datetime: (
    present: (
      de: "heute",
      en: "Present",
    ),
    // Stamped from the build date: a CV that keeps floating around in some
    // recruiting database should say how fresh it is.
    updated: (
      de: "Stand",
      en: "Updated",
    ),
  ),
  headings: (
    professional-experience: (
      en: "Professional Experience",
      de: "Berufserfahrung",
    ),
    projects: (
      en: "Projects",
      de: "Projekte",
    ),
    education: (
      en: "Education",
      // Not "Ausbildung", which in German connotes vocational training.
      de: "Studium",
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
      de: "Hobbys & Interessen",
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
      de: "Muttersprache",
    ),
    fluent: (
      en: "fluent",
      de: "verhandlungssicher",
    ),
    conversational: (
      en: "conversational",
      de: "gute Kenntnisse",
    ),
    c2: "C2",
    c1: "C1",
    b2: "B2",
    b1: "B1",
  ),
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
  projects: (),
  // Optional line in the footer, opposite the update stamp: where this
  // document came from, for a reader who cares how it was made.
  colophon: none,
) = {
  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 1.3cm),
    footer: context text(
      font: fonts.sans,
      size: sizes.sublabel,
      fill: colors.neutral,
    )[
      // The global link rule sizes links for the body; the footer is smaller.
      #show link: set text(size: sizes.sublabel)
      #if colophon != none { localized(colophon) }
      #h(1fr)
      #localized(l8n.datetime.updated) #datetime.today().display("[month]/[year]")
    ],
    footer-descent: 0.5em,
  )
  set text(font: fonts.serif, size: sizes.body, tracking: -0.1pt)
  set par(justify: false, leading: spacing-main.line)

  show title : set text(size: sizes.name, weight: "medium", tracking: -0.2pt)
  show heading.where(level: 1) : set text(
    font: fonts.sans,
    fill: colors.accent,
    size: sizes.label,
    weight: "semibold",
    tracking: 0.8pt,
  )
  show heading.where(level: 1): set block(above: 0pt, below: 0.5em)
  // Sticky: a heading stranded at the foot of a column, with its content on
  // the next page, reads as a section with nothing in it.
  show heading.where(level: 1): it => block(sticky: true, above: spacing-main.section)[
    #upper(it.body)
  ]
  show link : set text(font: fonts.sans, size: sizes.label)

  grid(
    columns: (1.95fr, 1fr),
    column-gutter: 2em,
    [
      // Justified in the main column only: the flush right edge makes the
      // block structure of each entry legible. The sidebar stays ragged --
      // its measure is far too narrow to justify without rivers.
      #set par(justify: true)

      #title(name)
      #text(
        upper(localized(tagline)),
        font: fonts.sans,
        size: 9pt,
        fill: colors.accent,
        weight: "semibold",
        tracking: 0.8pt,
      )

      #v(spacing-main.section)
      #localized(profile)

      = #localized(l8n.headings.professional-experience)

      // Each entry is an unbreakable block: a title, its dates and the first
      // bullet split over a page boundary read as two unrelated fragments.
      #let entries(entries) = for job in entries [
        #show heading.where(level: 2): set block(above: 0pt)
        #set par(spacing: 0.8em)
        #block(sticky: true, above: spacing-main.job)[
          == #localized(job.title) #h(1fr)#text(font: fonts.sans, size: sizes.label, fill: colors.neutral, weight: "regular")[
            #display-date(job.from, pattern: month-format) --
            #if job.to == none { localized(l8n.datetime.present) } else { display-date(job.to, pattern: month-format) }
          ]

          #if "company" in job and "place" in job [
            #v(-0.25em)
            #text(size: sizes.body)[
              #box[#text(job.company, style: "italic"),] #box[#localized(job.place)]
            ]
          ]
        ]

        #if "items" in job [
          #set par(spacing: spacing-main.item)
          #for item in job.items [
            #par(localized(item))
          ]
        ]
      ]

      #entries(jobs)

      #if projects.len() > 0 [
        = #localized(l8n.headings.projects)

        #entries(projects)
      ]

    ],
    [
      #set align(right)
      #par[
        #set text(size: sizes.label, font: fonts.sans)
        #contact
      ]

      #set align(left)
      // The sidebar overrides the main column's rhythm with its own scale,
      // which is what makes it fit on the first page.
      #set par(justify: false, spacing: spacing-sidebar.item, leading: spacing-sidebar.line)
      #show heading.where(level: 1): it => block(sticky: true, above: spacing-sidebar.section)[
        #upper(it.body)
        #v(spacing-sidebar.item)
      ]

      = #localized(l8n.headings.education)

      #for item in education [
        #text(weight: "bold")[#localized(item.title)]
        #h(1fr)
        #text(font: fonts.sans, size: sizes.label, fill: colors.neutral)[
          #display-date(item.from, pattern: year-format)--#display-date(item.to, pattern: year-format)
        ]
        \
        #text(localized(item.institution), style: "italic")
        #if "details" in item [
          \ #localized(item.details)
        ]

      ]

      = #localized(l8n.headings.languages)

      #for item in languages [
        #box[
          #text(localized(l8n.languages.at(item.language)), weight: "bold"),
          #localized(l8n.languageLevels.at(item.level))
        ]
        #h(1.5em)
      ]

      = #localized(l8n.headings.skills)

      #for section in skills [
        #show heading.where(level: 2) : set text(
          size: sizes.sublabel,
          font: fonts.sans,
          fill: colors.neutral,
          weight: "regular",
          tracking: 1.3pt,
        )
        #show heading.where(level: 2) : it => [ #v(0.45em)#upper(it.body) ]

        // A category is one unit: its label stranded at the foot of the column,
        // or two of its items orphaned on the next page, reads as a typesetting
        // error rather than as a list that happens to continue.
        #block(breakable: false, above: spacing-sidebar.item, below: 0pt)[
          == #localized(section.category) \
          #if "items" in section {
            for item in section.items [
              #box(localized(item))#h(1em)
            ]
          }

          #if "subsections" in section {
            for subsection in section.subsections [
              #box(text(fill: colors.neutral, size: sizes.label, font: fonts.sans)[#localized(subsection.label)])#h(1em)
              #for item in subsection.items [
                #box(localized(item))#h(1em)
              ]

            ]
          }
        ]
      ]

      = #localized(l8n.headings.hobbies)

      #for hobby in hobbies [
        #localized(hobby) \
      ]
    ]
  )

}
