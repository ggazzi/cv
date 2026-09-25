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
// line 5.3pt < item 10pt < job 17pt < section 28pt.
#let spacing = (
  line: 5.3pt,
  item: 10pt,
  job: 17pt,
  section: 28pt,
)

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
    projects: (
      en: "Projects",
      de: "Projekte",
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
    ),
    c2: "C2",
    c1: "C1",
    b2: "B2",
    b1: "B1",
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
  projects: (),
) = {
  set page(paper: "a4", margin: (x: 1.5cm, y: 1.3cm))
  set text(font: fonts.serif, size: sizes.body, tracking: -0.1pt)
  set par(justify: false, leading: spacing.line)

  show title : set text(size: sizes.name, weight: "medium", tracking: -0.2pt)
  show heading.where(level: 1) : set text(
    font: fonts.sans,
    fill: colors.accent,
    size: sizes.label,
    weight: "semibold",
    tracking: 0.8pt,
  )
  show heading.where(level: 1): set block(above: 0pt, below: 0.5em)
  show heading.where(level: 1): it => [
    #v(spacing.section)
    #upper(it.body)
  ]

  grid(
    columns: (1.85fr, 1fr),
    column-gutter: 3em,
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

      #v(spacing.section)
      #localized(profile)

      = #localized(l8n.headings.professional-experience)

      #let entries(entries) = for job in entries [
        #show heading.where(level: 2): set block(above: spacing.job)
        #set par(spacing: 0.8em)
        == #localized(job.title) #h(1fr)#text(font: fonts.sans, size: sizes.label, fill: colors.neutral, weight: "regular")[
          #display-date(job.from, pattern: month-format) --
          #if job.to == none { localized(l8n.datetime.present) } else { display-date(job.to, pattern: month-format) }
        ]

        #if "company" in job and "place" in job [
          #v(-0.45em)
          #text(size: sizes.body)[
            #box[#text(job.company, style: "italic"),] #box[#localized(job.place)]
          ]
        ]

        #if "items" in job [
          #set par(spacing: spacing.item)
          #for item in job.items [
            #par(localized(item))
          ]
        ] else if not ("company" in job and "place" in job) [
          // For multiple sequential job titles at the same company,
          // which are then displayed as a group
          #v(-1.2em)
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
      #set par(justify: false, spacing: 1.2em)

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
        #text(localized(l8n.languages.at(item.language)), weight: "bold"),
        #localized(l8n.languageLevels.at(item.level)) \
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
        == #localized(section.category) \
        #for item in section.items [
          #box(localized(item))#h(1em)
        ]
      ]

      = #localized(l8n.headings.hobbies)

      #for hobby in hobbies [
        #localized(hobby) \
      ]
    ]
  )

}
