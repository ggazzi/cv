#import "template/cv.typ": cv, webProfile

// Language is chosen at build time: `typst compile --input lang=de`.
// Every localisable value in this file is a (en:, de:) dictionary.
#set text(lang: sys.inputs.at("lang", default: "en"))

#cv(
  name: [Guilherme Grochau Azzi],
  tagline: (
    en: [Senior Software Engineer],
    de: [Senior Software Engineer],
  ),
  contact: [
    Talstr. 3, 13189 Berlin \
    #text(weight: "bold")[+49 176 66724098] \
    #text(weight: "bold")[gui.g.azzi\@gmail.com] \
    #webProfile("github.com", "ggazzi") \
    #webProfile("linkedin.com", "grochauazzi", path: "in/")
  ],

  profile: (
    en: [
      Working in software for over 10 years, seven of them building production systems, most recently backend platforms and cloud infrastructure.
      Drawn to problems where getting the domain model right is the hard part, from the concepts themselves to how the system behaves over time.
      Sets technical direction for cross-functional teams and mentors engineers towards seniority.
      Advocates software architecture and automated testing, and the disciplined use of AI to raise productivity without costing quality.
    ],
    de: [
      Seit über 10 Jahren in der Softwareentwicklung, davon sieben Jahre in der Entwicklung von Systemen für den Produktiveinsatz, zuletzt Backend-Plattformen und Cloud-Infrastruktur.
      Besonderes Interesse an Problemen, bei denen das richtige Domänenmodell die eigentliche Herausforderung ist: von den Konzepten selbst bis zum Verhalten des Systems.
      Erfahrung in der technischen Führung crossfunktionaler Teams und im Mentoring von Engineers auf dem Weg zur Senior-Rolle.
      Überzeugt von Softwarearchitektur und automatisiertem Testen sowie vom disziplinierten Einsatz von KI, um ohne Qualitätseinbußen die Produktivität zu steigern.
    ],
  ),

  education: (
    (
      title: (
        en: "M.Sc. Computer Science",
        de: "M.Sc. Informatik",
      ),
      institution: "Universidade Federal do Rio Grande do Sul",
      details: (
        en: "Thesis on conflict detection in graph and model transformation",
        de: "Masterarbeit über Konflikterkennung in Graph- und Modelltransformationen",
      ),
      from: datetime(year: 2016, month: 3, day: 1),
      to: datetime(year: 2018, month: 8, day: 31),
    ),
    (
      title: (
        en: "B.Sc. Computer Science",
        de: "B.Sc. Informatik",
      ),
      institution: [
        #box[Technische Universität Berlin] &
        #box[Universidade Federal do Rio Grande do Sul]
      ],
      details: (
        en: "Double degree programme",
        de: "Doppelabschlussprogramm",
      ),
      from: datetime(year: 2010, month: 3, day: 1),
      to: datetime(year: 2015, month: 6, day: 30),
    ),
  ),

  languages: (
    (language: "en", level: "c2"),
    (language: "de", level: "c2"),
    (language: "pt", level: "native"),
    (language: "es", level: "b1"),
  ),

  hobbies: (
    (en: "Musical Theatre", de: "Musicaltheater"),
    "Smart Home / Smart Lighting",
    (en: "Tabletop RPGs", de: "Tabletop Rollenspiele"),
  ),

  skills: (
    (
      category: (en: "Programming Languages", de: "Programmiersprachen"),
      subsections: (
        (
          label: (en: "fluent in", de: "sehr gute Kenntnisse in"),
          items: (
            "TypeScript",
            "JavaScript",
            "Python",
            "Ruby",
            "Rust",
          ),
        ),
        (
          label: (en: "also productive in", de: "fundierte Kenntnisse in"),
          items: (
            "Go",
            "Java",
            "Scala",
            "Haskell",
            "Elm",
            "Elixir",
            "C++",
          )
        ),
      )
    ),
    (
      category: (en: "Cloud & Infrastructure", de: "Cloud & Infrastruktur"),
      items: (
        "AWS Lambda",
        "AWS ECS",
        "AWS Kinesis",
        "Cloudflare Workers",
        "Cloudflare Durable Objects",
        "Terraform",
        "Docker",
        "Nix",
        "GitHub Actions",
      )
    ),
    (
      category: (en: "Data & AI", de: "Daten & KI"),
      items: (
        "SQL",
        "AWS DynamoDB",
        "AWS S3",
        "Cloudflare D1",
        "Cloudflare R2",
        "Gemini API",
        "Claude Code",
        (en: "AI-Assisted Development", de: "KI-gestützte Entwicklung"),
      ),
    ),
    (
      category: (en: "Web", de: "Web"),
      items: (
        "React",
        "Svelte",
        "Hono",
        "Playwright",
        "REST",
        "GraphQL",
        "Contentful",
      ),
    ),
    (
      category: (en: "Architecture & Practices", de: "Architektur & Praktiken"),
      items: (
        // "System Design" is the term used in German tech; "Systementwurf"
        // reads academic. Same reasoning for the anglicisms below.
        "System Design",
        "Domain-Driven Design",
        (en: "Automated Testing", de: "Automatisiertes Testen"),
        "Continuous Integration",
        "Observability & SLOs",
        (en: "Technical Writing", de: "Technische Dokumentation"),
      )
    ),
    (
      category: (en: "Leadership & Collaboration", de: "Führung & Zusammenarbeit"),
      items: (
        (en: "Cross-Functional Leadership", de: "Crossfunktionale Führung"),
        (en: "Stakeholder Communication", de: "Stakeholder-Kommunikation"),
        (en: "Mentorship & Pairing", de: "Mentoring und Pair Programming"),
        (en: "Teaching", de: "Lehre"),
      )
    ),
  ),

  jobs: (
    (
      title: (en: "Career Break", de: "Sabbatical"),
      from: datetime(year: 2026, month: 07, day: 01),
      to: none,
      items: (
        (
          en: [Personal projects and professional development.],
          de: [Eigene Projekte und fachliche Weiterbildung.],
        ),
      ),
    ),
    (
      title: "Senior Backend Software Engineer",
      company: "Babbel GmbH",
      place: (en: "Berlin, Germany", de: "Berlin, Deutschland"),
      from: datetime(year: 2024, month: 05, day: 01),
      to: datetime(year: 2026, month: 06, day: 30),
      items: (
        (
          en: [Delivered Babbel's first personalised lesson experience, leading a team of seven engineers and domain experts and moderating competing perspectives.],
          de: [Umsetzung der ersten personalisierten Lernerfahrung bei Babbel; Leitung eines Teams aus sieben Engineers und Fachexperten sowie Moderation konkurrierender Perspektiven.],
        ),
        (
          en: [Owned the technical and architectural decisions; shared accountability for the roadmap with the team's Product Manager.],
          de: [Verantwortung für die technischen und architektonischen Entscheidungen; gemeinsame Verantwortung für die Roadmap mit dem Product Manager des Teams.],
        ),
        (
          en: [Enabled three new ML-based features within a year by providing the content platform with a Databricks integration and a GraphQL API.],
          de: [Grundlage für drei neue ML-basierte Features innerhalb eines Jahres: #box[Databricks]-Integration und GraphQL-API für die Content-Plattform.],
        ),
        (
          en: [Mentored a colleague through their progression from Professional to Senior Engineer.],
          de: [Mentoring eines Teammitglieds beim Aufstieg von Professional zu Senior Engineer.],
        ),
        (
          en: [Improved reliability by introducing Service Level Objectives (SLOs).],
          de: [Verbesserung der Zuverlässigkeit durch Einführung von #box[Service] #box[Level] #box[Objectives] (SLOs).],
        ),
      ),
    ),
    (
      title: "Backend Software Engineer",
      company: "Babbel GmbH",
      place: (en: "Berlin, Germany", de: "Berlin, Deutschland"),
      from: datetime(year: 2022, month: 11, day: 15),
      to: datetime(year: 2024, month: 04, day: 30),
      items: (
        (
          en: [Co-designed the integration of the in-house CMS with Contentful, on which five new learning experiences were built within a year.],
          de: [Mitgestaltung der Integration des internen CMS mit Contentful, auf der innerhalb eines Jahres fünf neue Lernerfahrungen aufgebaut wurden.],
        ),
        (
          en: [Maintained and extended the content platform as part of the team responsible for it (TypeScript, Go and Ruby codebases; deployed to AWS Lambda, DynamoDB, S3, Kinesis and ECS via Terraform).],
          de: [Wartung und Erweiterung der Content-Plattform im verantwortlichen Team (Codebasen in TypeScript, Go und Ruby; Deployment auf AWS Lambda, DynamoDB, S3, Kinesis und ECS via Terraform).],
        ),
        (
          en: [Built extensions to Contentful and maintained Babbel's internal CMS (React).],
          de: [Entwicklung von Contentful-Erweiterungen und Wartung des internen CMS von Babbel (React).],
        ),
        (
          en: [Streamlined workflows by improving CI and monorepo tooling.],
          de: [Effizientere Arbeitsabläufe durch Verbesserungen am CI- und Monorepo-Tooling.],
        ),
      ),
    ),
    (
      title: (
        en: "Teaching and Research Assistant",
        de: "Wissenschaftlicher Mitarbeiter",
      ),
      company: "Technische Universität Berlin",
      place: (en: "Berlin, Germany", de: "Berlin, Deutschland"),
      from: datetime(year: 2018, month: 11, day: 15),
      to: datetime(year: 2022, month: 06, day: 30),
      items: (
        (
          en: [Secured a research grant of over €200,000 for the SFAssist project, together with an industry partner specialising in embedded software.],
          de: [Einwerbung von Fördermitteln über 200.000 € für das Projekt SFAssist, gemeinsam mit einem Industriepartner für Embedded Software.],
        ),
        (
          en: [Organised four courses and taught in them, among them Software Engineering and Programming Paradigms.],
          de: [Organisation und Durchführung von vier Lehrveranstaltungen, darunter Software Engineering und Programmierparadigmen.],
        ),
        (
          en: [Moved the teaching of a 750-student course to a fully remote format during the pandemic.],
          de: [Umstellung einer Lehrveranstaltung mit 750 Studierenden auf ein vollständig digitales Format während der Pandemie.],
        ),
        (
          en: [Supervised student teams of 10 to 15 building systems with a backend, a web frontend and an embedded Arduino component, guiding them in technical and organisational matters.],
          de: [Fachliche und organisatorische Betreuung von Studierendenteams mit 10 bis 15 Mitgliedern beim Bau von Systemen aus Backend, Web-Frontend und eingebetteter Arduino-Komponente.],
        ),
        (
          en: [Advised four Bachelor's theses.],
          de: [Betreuung von vier Bachelorarbeiten.],
        ),
        (
          en: [Automated manual teaching-administration tasks with Python and SQLite, bridging university systems that offered no integration.],
          de: [Automatisierung manueller Verwaltungsaufgaben der Lehre mit Python und SQLite; Verbindung von Universitätssystemen ohne vorhandene Schnittstellen.],
        ),
      )
    ),
    (
      title: (en: "Research Assistant", de: "Wissenschaftlicher Mitarbeiter"),
      company: "Universidade Federal do Rio Grande do Sul",
      place: (en: "Porto Alegre, Brazil", de: "Porto Alegre, Brasilien"),
      from: datetime(year: 2016, month: 3, day: 01),
      to: datetime(year: 2018, month: 08, day: 31),
      items: (
        (
          en: [Researched formal methods and model transformations.],
          de: [Forschung zu formalen Methoden und Modelltransformationen.],
        ),
        (
          en: [Architected Verigraph, an open-source graph transformation engine (see Projects).],
          de: [Architektur von Verigraph, einer Open-Source-Engine für Graphtransformationen (siehe Projekte).],
        ),
        (
          en: [Published as first author #emph[On the essence and initiality of conflicts in M-adhesive transformation systems] (Journal of Logical and Algebraic Methods in Programming, 2019), cited 28 times.],
          de: [Veröffentlichung als Erstautor: #emph[On the essence and initiality of conflicts in M-adhesive transformation systems] (Journal of Logical and Algebraic Methods in Programming, 2019), 28 Zitationen.],
        ),
      )
    ),
    (
      title: (en: "Software Developer", de: "Softwareentwickler"),
      company: "Inetsoft Informática",
      place: (en: "Porto Alegre, Brazil", de: "Porto Alegre, Brasilien"),
      from: datetime(year: 2015, month: 5, day: 01),
      to: datetime(year: 2016, month: 3, day: 01),
      items: (
        (
          en: [Developed a web frontend with JavaScript, RxJS and CycleJS.],
          de: [Entwicklung eines Web-Frontends mit JavaScript, RxJS und CycleJS.],
        ),
        (
          en: [Integrated the web frontend into a legacy GUI with CEF.],
          de: [Integration des Web-Frontends in eine Legacy-GUI mittels CEF.],
        ),
      )
    ),
    (
      title: (en: "Research Assistant", de: "Studentische Hilfskraft"),
      company: "Technische Universität Berlin",
      place: (en: "Berlin, Germany", de: "Berlin, Deutschland"),
      from: datetime(year: 2014, month: 9, day: 01),
      to: datetime(year: 2015, month: 3, day: 31),
      items: (
        (
          en: [Researched formal methods: theorem proving for embedded software.],
          de: [Forschung zu formalen Methoden: Theorembeweisen für Embedded Software.],
        ),
      )
    ),
    (
      title: (en: "Research Assistant", de: "Studentische Hilfskraft"),
      company: "Universidade Federal do Rio Grande do Sul",
      place: (en: "Porto Alegre, Brazil", de: "Porto Alegre, Brasilien"),
      from: datetime(year: 2010, month: 8, day: 01),
      to: datetime(year: 2012, month: 7, day: 31),
      items: (
        (
          en: [Developed intelligent agents for traffic simulation in Python.],
          de: [Entwicklung intelligenter Agenten für Verkehrssimulation in Python.],
        ),
        (
          en: [Researched traffic planning and simulation.],
          de: [Forschung zu Verkehrsplanung und -simulation.],
        ),
      )
    ),
  ),

  colophon: (
    en: [Typeset with #link("https://typst.app")[Typst] · source: #link("https://github.com/ggazzi/cv")[github.com/ggazzi/cv]],
    de: [Gesetzt mit #link("https://typst.app")[Typst] · Quelltext: #link("https://github.com/ggazzi/cv")[github.com/ggazzi/cv]],
  ),
  projects: (
    (
      title: "Textum",
      from: datetime(year: 2026, month: 07, day: 01),
      to: none,
      items: (
        [#link("https://ttrpg-companion.gui-azzi.de/")],
        (
          en: [Full-stack application for shared TTRPG campaign notes: Svelte on Cloudflare Pages, Hono on Cloudflare Workers, Durable Objects with SQLite, D1 and R2.],
          de: [Full-Stack-Anwendung für gemeinsame TTRPG-Kampagnennotizen: Svelte auf Cloudflare Pages, Hono auf Cloudflare Workers, Durable Objects mit SQLite, D1 und R2.],
        ),
        (
          en: [Explores LLM-assisted structuring of freeform text via the Gemini API: entity detection, summaries and title suggestions.],
          de: [Erprobung LLM-gestützter Strukturierung von Freitext über die Gemini API: Entitätserkennung, Zusammenfassungen und Titelvorschläge.],
        ),
      ),
    ),
    (
      title: "Verigraph",
      from: datetime(year: 2016, month: 3, day: 01),
      to: datetime(year: 2018, month: 08, day: 31),
      items: (
        [#link("https://github.com/Verites/verigraph")],
        (
          en: [Architected and contributed to an open-source graph transformation engine (Haskell), introducing CI pipelines, unit testing and test coverage metrics.],
          de: [Architektur und Mitentwicklung einer Open-Source-Engine für Graphtransformationen (Haskell); Einführung von CI-Pipelines, Unit-Tests und Testabdeckungsmetriken.],
        ),
      ),
    ),
  ),
)
