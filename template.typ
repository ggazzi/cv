// Reusable CV layout/i18n. Content files import this and call `resume(..)`.

#let month-names = (
  en: ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
  de: ("Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"),
)

#let ui = (
  present: (en: "Present", de: "heute"),
)

// Builds the helpers that close over `lang`: t (dict -> current-language
// value), fmt-date/fmt-range (localized dates), job, section, title.
#let make(lang) = {
  let accent = rgb("#1f6fb2")

  let t(x) = if type(x) == dictionary {
    x.at(lang, default: x.at("en", default: none))
  } else {
    x
  }

  let fmt-date(d) = month-names.at(lang).at(d.month() - 1) + " " + str(d.year())

  let fmt-range(dates) = fmt-date(dates.from) + " – " + (
    if dates.to == none { t(ui.present) } else { fmt-date(dates.to) }
  )

  let job(role, org, place, dates, bullets) = [
    #text(weight: "bold", t(role)) \
    #emph(org)#if place != none [, #t(place)]
    #v(0.1em)
    #text(size: 8.5pt, fill: rgb("#666666"), upper(fmt-range(dates)))
    #v(0.15em)
    #for b in bullets [
      - #t(b)
    ]
    #v(0.35em)
  ]

  let section(body) = [
    #v(0.4em)
    #text(size: 11pt, weight: "bold", fill: accent, tracking: 0.05em, upper(body))
    #v(0.2em)
    #line(length: 100%, stroke: 0.5pt + accent)
    #v(0.3em)
  ]

  let title(body) = text(size: 26pt, weight: "bold", body)

  (t: t, fmt-range: fmt-range, job: job, section: section, title: title)
}

// Full-page layout: name/tagline/contact header, summary, then a
// (main, sidebar) two-column body. `main` and `sidebar` are functions
// taking the helper dict from `make` and returning content.
#let resume(lang: "en", name: none, tagline: none, contact: none, summary: none, main: none, sidebar: none) = {
  let h = make(lang)
  let (t, title) = h

  set page(paper: "a4", margin: (x: 1.8cm, y: 1.3cm))
  set text(font: "Libertinus Serif", size: 9.1pt)
  set par(justify: true, leading: 0.48em)

  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #title[#name]
      #v(0.1em)
      #text(size: 12pt, style: "italic")[#t(tagline)]
    ],
    [
      #set text(size: 9pt)
      #set align(right)
      #contact
    ]
  )

  v(0.6em)
  par(justify: true)[#t(summary)]
  v(0.5em)

  grid(
    columns: (2fr, 1fr),
    column-gutter: 1.5em,
    main(h),
    sidebar(h),
  )
}
