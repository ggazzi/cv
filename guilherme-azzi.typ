#import "template.typ": cv, webProfile

#set text(lang: "en")

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
      TODO
    ],
  ),

  education: (
    (
      title: "M.Sc. Computer Science",
      institution: "Universidade Federal do Rio Grande do Sul",
      details: (
        en: "Thesis on conflict detection in graph and model transformation",
        de: "TODO",
      ),
      from: datetime(year: 2016, month: 3, day: 1),
      to: datetime(year: 2018, month: 8, day: 31),
    ),
    (
      title: "B.Sc. Computer Science",
      institution: [
        #box[Technische Universität Berlin] &
        #box[Universidade Federal do Rio Grande do Sul]
      ],
      details: (
        en: "Double degree programme",
        de: "TODO",
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
    "Musical Theatre",
    "Smart Home / Smart Lighting",
    (en: "Tabletop RPGs", de: "Tabletop Rollenspiele"),
  ),

  skills: (
    (
      category: (en: "Programming Languages", de: "Programmiersprachen"),
      items: (
        "TypeScript/JavaScript",
        "Python",
        "Go",
        "Ruby",
      )
    ),
    (
      category: (en: "Also Familiar With", de: "Grundkenntnisse"),
      items: (
        "Java",
        "Scala",
        "Rust",
        "Haskell",
        "Elm",
        "Elixir"
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
        (en: "AI-Assisted Development", de: "KI-gestützte Entwicklung"),
      ),
    ),
    (
      category: (en: "Web", de: "Web"),
      items: (
        "React",
        "Svelte",
        "Hono",
        "Contentful",
      ),
    ),
    (
      category: (en: "Architecture & Practices", de: "Architektur & Praktiken"),
      items: (
        (en: "System Design", de: "Systementwurf"),
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
        (en: "Cross-Functional Leadership", de: "Interdisziplinäre Führung"),
        (en: "Stakeholder Communication", de: "Stakeholder-Kommunikation"),
        (en: "Mentorship & Pairing", de: "Mentoring und Pair Programming"),
        (en: "Teaching", de: "Lehre"),
      )
    ),
  ),

  jobs: (
    (
      title: (en: "Career Break", de: "Berufliche Auszeit"),
      from: datetime(year: 2026, month: 07, day: 01),
      to: none,
      items: (
        [Personal projects and professional development.],
      ),
    ),
    (
      title: "Senior Backend Software Engineer",
      company: "Babbel GmbH",
      place: "Berlin, Germany",
      from: datetime(year: 2024, month: 05, day: 01),
      to: datetime(year: 2026, month: 06, day: 30),
      items: (
        [Delivered Babbel's first personalised lesson experience, leading a team of seven engineers and domain experts and moderating competing perspectives.],
        [Owned the technical and architectural decisions; shared accountability for the roadmap with the team's Product Manager.],
        [Mentored a colleague through their progression from Professional to Senior Engineer.],
        [Improved reliability by introducing Service Level Objectives (SLOs).],
      ),
    ),
    (
      title: "Backend Software Engineer",
      company: "Babbel GmbH",
      place: "Berlin, Germany",
      from: datetime(year: 2022, month: 11, day: 15),
      to: datetime(year: 2024, month: 04, day: 30),
      items: (
        [Co-designed the integration of the in-house CMS with Contentful, on which five new learning experiences were built within a year.],
        [Maintained and extended the content platform as part of the team responsible for it (TypeScript, Go and Ruby codebases; deployed to AWS Lambda, DynamoDB, S3, Kinesis and ECS via Terraform).],
        [Built extensions to Contentful and maintained Babbel's internal CMS (React).],
        [Streamlined workflows by improving CI and monorepo tooling.],
      ),
    ),
    (
      title: "Teaching and Research Assistant",
      company: "Technische Universität Berlin",
      place: "Berlin, Germany",
      from: datetime(year: 2018, month: 11, day: 15),
      to: datetime(year: 2022, month: 06, day: 30),
      items: (
        [Secured a research grant of over €200,000 for the SFAssist project, together with an industry partner specialising in embedded software.],
        [Organised four courses and taught in them, among them Software Engineering and Programming Paradigms.],
        [Moved the teaching of a 750-student course to a fully remote format during the pandemic.],
        [Supervised student teams of 10 to 15 building systems with a backend, a web frontend and an embedded Arduino component, guiding them in technical and organisational matters.],
        [Advised four Bachelor's theses.],
        [Automated manual teaching-administration tasks with Python and SQLite, bridging university systems that offered no integration.],
      )
    ),
    (
      title: "Research Assistant",
      company: "Universidade Federal do Rio Grande do Sul",
      place: "Porto Alegre, Brazil",
      from: datetime(year: 2016, month: 3, day: 01),
      to: datetime(year: 2018, month: 08, day: 31),
      items: (
        [Researched formal methods and model transformations.],
        [Architected Verigraph.],
        [Published as first author #emph[On the essence and initiality of conflicts in M-adhesive transformation systems] (Journal of Logical and Algebraic Methods in Programming, 2019), cited 28 times.],
      )
    ),
    (
      title: "Software Developer",
      company: "Inetsoft Informática",
      place: "Porto Alegre, Brazil",
      from: datetime(year: 2015, month: 5, day: 01),
      to: datetime(year: 2016, month: 3, day: 01),
      items: (
        [Developed a web frontend with JavaScript, RxJS and CycleJS.],
        [Integrated the web frontend into a legacy GUI with CEF.],
      )
    ),
    (
      title: "Research Assistant",
      company: "Technische Universität Berlin",
      place: "Berlin, Germany",
      from: datetime(year: 2014, month: 9, day: 01),
      to: datetime(year: 2015, month: 3, day: 31),
      items: (
        [Researched formal methods: theorem proving for embedded software.],
      )
    ),
    (
      title: "Research Assistant",
      company: "Universidade Federal do Rio Grande do Sul",
      place: "Porto Alegre, Brazil",
      from: datetime(year: 2010, month: 8, day: 01),
      to: datetime(year: 2012, month: 7, day: 31),
      items: (
        [Developed intelligent agents for traffic simulation in Python.],
        [Researched traffic planning and simulation.],
      )
    ),
  ),

  projects: (
    (
      title: "Textum",
      from: datetime(year: 2026, month: 07, day: 01),
      to: none,
      items: (
        [#link("https://ttrpg-companion.gui-azzi.de/")],
        [Full-stack application for shared TTRPG campaign notes: Svelte on Cloudflare Pages, Hono on Cloudflare Workers, Durable Objects with SQLite, D1 and R2.],
        [Explores LLM-assisted structuring of freeform text via the Gemini API: entity detection, summaries and title suggestions.],
      ),
    ),
    (
      title: "Verigraph",
      from: datetime(year: 2016, month: 3, day: 01),
      to: datetime(year: 2018, month: 08, day: 31),
      items: (
        [#link("https://github.com/Verites/verigraph")],
        [Architected and contributed to an open-source graph transformation engine (Haskell), introducing CI pipelines, unit testing and test coverage metrics.],
      ),
    ),
  ),
)
