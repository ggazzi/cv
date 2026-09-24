#import "template_new.typ": cv, webProfile

#set text(lang: "en")

#cv(
  name: [Guilherme Grochau Azzi],
  tagline: [Software Engineer and Computer Scientist],
  contact: [
    Talstr. 3, 13189 Berlin \
    #text(weight: "bold")[+49 176 66724098] \
    #text(weight: "bold")[gui.g.azzi\@gmail.com] \
    #webProfile("github.com", "ggazzi") \
    #webProfile("linkedin.com", "grochauazzi", path: "in/")
  ],

  profile: [
    Software engineer with over 7 years of experience in backend platforms, distributed cloud infrastructure and academic research.
    Highly adaptable to new technologies and concepts.
    Experienced in the deliberate use of AI to boost productivity without sacrificing quality.
    A committed advocate for software architecture and testing.
    Values working in teams whose members support and learn from each other.
  ],

  education: (
    (
      title: "M.Sc. Computer Science",
      institution: "Universidade Federal do Rio Grande do Sul",
      from: datetime(year: 2016, month: 3, day: 1),
      to: datetime(year: 2018, month: 8, day: 31),
    ),
    (
      title: "B.Sc. Computer Science",
      institution: "Technische Universität Berlin and Universidade Federal do Rio Grande do Sul (double degree program)",
      from: datetime(year: 2010, month: 3, day: 1),
      to: datetime(year: 2015, month: 6, day: 30),
    ),
  ),

  languages: (
    (language: "English", level: "fluent"),
    (language: "German", level: "fluent"),
    (language: "Portuguese", level: "native"),
    (language: "Spanish", level: "conversational"),
  ),

  hobbies: (
    "Musical Theatre",
    "Smart Home / Smart Lighting",
    "Tabletop RPGs",
  ),

  skills: (
    (
      category: "Programming Languages",
      items: (
        "JavaScript/TypeScript",
        "Python",
        "Go",
        "Ruby",
        "Java",
        "Scala",
        "Rust",
        "Haskell"
      )
    ),
    (
      category: "Cloud & Infrastructure",
      items: (
        "AWS Lambda",
        "AWS ECS",
        "Cloudflare Functions",
        "Cloudflare Durable Objects",
        "Terraform",
        "Docker",
        "Nix",
        "GitHub Actions",
      )
    ),
    (
      category: "Databases",
      items: (
        "SQL",
        "AWS DynamoDB",
        "AWS S3"
      ),
    ),
    (
      category: "Engineering Practices",
      items: (
        "Automated Testing",
        "Continuous Integration",
        "Technical Writing",
        "Stakeholder Communication",
        "Cross-Functional Leadership",
        "Mentorship & Pairing",
      )
    )
  ),

  jobs: (
    (
      title: "Senior Backend Software Engineer",
      from: datetime(year: 2024, month: 05, day: 01),
      to: datetime(year: 2026, month: 06, day: 30),
    ),
    (
      title: "Backend Software Engineer",
      company: "Babbel GmbH",
      place: "Berlin, Germany",
      from: datetime(year: 2022, month: 11, day: 15),
      to: datetime(year: 2024, month: 04, day: 30),
      items: (
        [Maintained and extended the content platform (TypeScript, Go and Ruby codebases; deployed to AWS Lambda, DynamoDB, S3, Kinesis and ECS via Terraform).],
        [Integrated the content platform with Databricks, enabling new AI-based features to leverage Babbel's learning content.],
        [Improved reliability by introducing Service Level Objectives (SLOs).],
        [Streamlined workflows by improving CI and monorepo tooling.],
        [Led a tiger team that built the first personalized learning experience.],
        [Mentored a colleague through their progression from Professional to Senior Engineer.],
      ),
    ),
    (
      title: "Teaching and Research Assistant",
      company: "Technische Universität Berlin",
      place: "Berlin, Germany",
      from: datetime(year: 2018, month: 11, day: 15),
      to: datetime(year: 2022, month: 06, day: 30),
      items: (
        [Organised four different courses with up to 750 students per semester.],
        [Researched programming languages for deep learning.],
        [Advised four Bachelor's theses.],
        [Successfully obtained a research grant with an industry partner.],
        [Led a tiger team that build the first personalized learning experience.],
        [Used Python and SQLite to bridge disparate systems of the university.],
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
        [Architected and contributed to an open-source graph transformation engine, introducing CI pipelines, unit testing and test coverage metrics.],
      )
    ),
    (
      title: "Software Developer",
      company: "Inetsoft Informática",
      place: "Porto Alegre, Brazil",
      from: datetime(year: 2015, month: 5, day: 01),
      to: datetime(year: 2016, month: 3, day: 01),
      items: (
        [Developed a frontend with Javascript, RxJS and CycleJS],
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
        [Researched traffic planing and simulation.],
      )
    ),
  )
)
