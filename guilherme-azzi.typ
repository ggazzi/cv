// Compile: typst compile guilherme-azzi.typ guilherme-azzi-en.pdf --input lang=en
//          typst compile guilherme-azzi.typ guilherme-azzi-de.pdf --input lang=de
#import "template.typ": resume

#let lang = sys.inputs.at("lang", default: "en")

#let ui = (
  tagline: (en: "Software Engineer and Computer Scientist", de: "Informatiker und Softwareingenieur"),
  summary: (
    en: [Software engineer with over 7 years of experience in backend platforms, distributed cloud infrastructure and academic research. Highly adaptable to new technologies and concepts. Experienced in the deliberate use of AI to boost productivity without sacrificing quality. A committed advocate for software architecture and testing. Values working in teams whose members support and learn from each other.],
    de: [Softwareingenieur mit über 7 Jahren Erfahrung in den Bereichen Backend-Plattformen, verteilte Cloud-Infrastruktur und akademische Forschung. Sehr anpassungsfähig an neue Technologien und Konzepte. Erfahren im gezielten Einsatz von KI zur Steigerung der Produktivität ohne Qualitätseinbußen. Engagierter Verfechter von Softwarearchitektur und Testing. Schätzt die Arbeit in Teams, in denen sich die Mitglieder gegenseitig fördern und voneinander lernen.],
  ),
  experience: (en: "Professional Experience", de: "Berufserfahrung"),
  education: (en: "Education", de: "Ausbildung"),
  skills: (en: "Skills", de: "Kenntnisse & Fähigkeiten"),
  languages: (en: "Languages", de: "Sprachen"),
  hobbies: (en: "Hobbies & Interests", de: "Hobbies & Interessen"),
  babbel-caption: (en: "Professional: Nov 2022 – Apr 2024. Senior: May 2024 – Jun 2026.", de: "Professional: Nov 2022 – Apr 2024. Senior: Mai 2024 – Jun 2026."),
  double-degree: (en: "double degree program", de: "Doppelabschlussprogramm"),
  fluent: (en: "fluent", de: "verhandlungssicher"),
  native: (en: "native", de: "muttersprachler"),
  good-knowledge: (en: "good working knowledge", de: "gute Kenntnisse"),
)

#resume(
  lang: lang,
  name: "Guilherme Grochau Azzi",
  tagline: ui.tagline,
  contact: [
    Talstr. 3, 13189 Berlin \
    +49 176 66724098 \
    #text(weight: "bold")[gui.g.azzi\@gmail.com] \
    https://github.com/ggazzi \
    https://linkedin.com/in/grochauazzi
  ],
  summary: ui.summary,
  main: h => {
    let (t, job, section) = h
    [
      #section[#t(ui.experience)]

      #job(
        (en: "Backend Software Engineer", de: "Backend Softwareingenieur"),
        "Babbel GmbH", (en: "Germany", de: "Deutschland"),
        (from: datetime(year: 2022, month: 11, day: 15), to: datetime(year: 2026, month: 06, day: 30)),
        (
          (
            en: [Maintained and extended the content platform (TypeScript, Go and Ruby codebases; deployed to AWS Lambda, DynamoDB, S3, Kinesis and ECS via Terraform).],
            de: [Wartung und Erweiterung der Content-Plattform (Codebases in TypeScript, Go und Ruby; Deployment auf AWS Lambda, DynamoDB, S3, Kinesis und ECS via Terraform).]
          ),
          (
            en: [Integrated the content platform with Databricks, enabling new AI-based features to leverage Babbel's rich learning content.],
            de: [Integration der Content-Plattform mit Databricks, um neue KI-basierte Funktionen auf Basis der Lerninhalte von Babbel zu ermöglichen.]
          ),
          (en: [Improved reliability by introducing Service Level Objectives (SLOs).], de: [Verbesserung der Zuverlässigkeit durch die Einführung von Service Level Objectives (SLOs).]),
          (en: [Streamlined workflows by improving CI and monorepo tooling.], de: [Optimierung von Arbeitsabläufen durch Verbesserung der CI- und Monorepo-Tools.]),
          (en: [Led a tiger team building the first personalized learning experience.], de: [Leitung eines Tiger-Teams zur Erstellung der ersten personalisierten Lernerfahrung.]),
          (en: [Mentored a colleague through their progression from Professional to Senior Engineer.], de: [Mentoring einer Kollegin bei der Entwicklung vom Professional zum Senior Engineer.]),
        )
      )
      #text(size: 8.5pt, fill: rgb("#666666"))[#t(ui.babbel-caption)]
      #v(0.5em)

      #job(
        (en: "Research Associate", de: "Wissenschaftlicher Mitarbeiter"),
        "Technische Universität Berlin", (en: "Germany", de: "Deutschland"),
        (from: datetime(year: 2018, month: 11, day: 1), to: datetime(year: 2022, month: 6, day: 30)),
        (
          (en: [Organized four courses with up to 750 participants.], de: [Organisation vier Lehrveranstaltungen mit bis zu 750 Teilnehmern.]),
          (en: [Conducted research on programming languages for deep learning.], de: [Forschung im Bereich Programmiersprachen für Deep Learning.]),
          (en: [Supervised four successfully completed bachelor's theses.], de: [Betreuung von vier erfolgreich abgeschlossenen Bachelorarbeiten.]),
          (en: [Secured research funding for a project with an industry partner.], de: [Erwerb von Forschungsmitteln für ein Projekt mit Industriepartner.]),
          (en: [Ad-hoc integration of various university systems using Python and SQLite.], de: [Ad-hoc Integration verschiedener Systeme der Universität mit Python und SQLite.]),
        )
      )

      #job(
        (en: "Student Research Assistant", de: "Studentische Hilfskraft"),
        "Universidade Federal do Rio Grande do Sul", (en: "Porto Alegre, Brazil", de: "Porto Alegre, Brasilien"),
        (from: datetime(year: 2016, month: 3, day: 1), to: datetime(year: 2018, month: 8, day: 31)),
        (
          (en: [Research on formal methods and model transformations.], de: [Forschung im Bereich Formalen Methoden und Modelltransformationen.]),
          (en: [Developed an open-source system for graph transformations.], de: [Entwicklung eines Open-Source-Systems für Graphentransformationen.]),
          (en: [Improved the system's architecture.], de: [Verbesserung der Systemarchitektur.]),
          (en: [Introduced CI with unit tests and coverage metrics.], de: [Einführung von CI mit Unit-Tests und Abdeckungsmetriken.]),
        )
      )

      #job(
        (en: "Software Developer", de: "Softwareentwickler"),
        "Inetsoft Informática", (en: "Porto Alegre, Brazil", de: "Porto Alegre, Brasilien"),
        (from: datetime(year: 2015, month: 5, day: 1), to: datetime(year: 2016, month: 3, day: 31)),
        (
          (en: [Frontend development with JavaScript, RxJS and CycleJS.], de: [Frontend-Entwicklung mit JavaScript, RxJS und CycleJS.]),
          (en: [Integrated the web frontend into a C++-based GUI using CEF.], de: [Integration des Web-Frontends in eine C++-basierte GUI mit CEF.]),
        )
      )

      #job(
        (en: "Student Research Assistant", de: "Studentische Hilfskraft"),
        "Technische Universität Berlin", none,
        (from: datetime(year: 2014, month: 9, day: 1), to: datetime(year: 2015, month: 3, day: 31)),
        (
          (en: [Research on formal methods: theorem proving for embedded software.], de: [Forschung im Bereich Formalen Methoden: Theorembeweisen für eingebettete Software.]),
        )
      )

      #job(
        (en: "Student Research Assistant", de: "Studentische Hilfskraft"),
        "Universidade Federal do Rio Grande do Sul", none,
        (from: datetime(year: 2010, month: 8, day: 1), to: datetime(year: 2012, month: 7, day: 31)),
        (
          (en: [Developed intelligent agents for traffic simulation using Python.], de: [Entwicklung intelligenter Agenten für Verkehrssimulation mit Python.]),
          (en: [Research on traffic planning and simulation.], de: [Forschung im Bereich der Verkehrsplanung und Verkehrssimulation.]),
        )
      )
    ]
  },
  sidebar: h => {
    let (t, section) = h
    [
      #section[#t(ui.education)]

      #text(weight: "bold")[#t((en: "M.Sc. Computer Science", de: "M.Sc. Informatik"))] 2016–2018 \
      #emph[Universidade Federal do Rio Grande do Sul]
      #v(0.5em)

      #text(weight: "bold")[#t((en: "B.Sc. Computer Science", de: "B.Sc. Informatik"))] 2010–2015 \
      #emph[Technische Universität Berlin] #t((en: "and", de: "und")) #emph[Universidade Federal do Rio Grande do Sul] (#t(ui.double-degree))

      #section[#t(ui.skills)]
      JavaScript / TypeScript \
      Ruby \
      Python \
      Go \
      Haskell \
      Java \
      Scala \
      Rust \
      AWS Cloud \
      GitHub CI \
      Terraform \
      SQL \
      Docker \
      Nix \
      Technical writing

      #section[#t(ui.languages)]
      #text(weight: "bold")[#t((en: "German", de: "Deutsch"))], #t(ui.fluent) \
      #text(weight: "bold")[#t((en: "English", de: "Englisch"))], #t(ui.fluent) \
      #text(weight: "bold")[#t((en: "Portuguese", de: "Portugiesisch"))], #t(ui.native) \
      #text(weight: "bold")[#t((en: "Spanish", de: "Spanisch"))], #t(ui.good-knowledge)

      #section[#t(ui.hobbies)]
      #t((en: "Musical theatre", de: "Musical Theatre")) \
      #t((en: "Smart home / smart lighting", de: "Smart Home / Smart Lighting")) \
      #t((en: "Tabletop role-playing games", de: "Tabletop Rollenspielen"))
    ]
  },
)
