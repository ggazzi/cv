# Typst CV template

A two-column-free, single-source CV template for [Typst](https://typst.app).
One source file produces every language: each localisable value is an
`(en:, de:)` dictionary and the language is chosen at compile time with
`--input lang=de`.

## Use

```typ
#import "template/cv.typ": cv, webProfile

#set text(lang: sys.inputs.at("lang", default: "en"))

#cv(
  name: [Your Name],
  tagline: (en: [Software Engineer], de: [Softwareentwickler]),
  ...
)
```

Compile with the vendored fonts, ignoring the system font book:

```sh
typst compile --font-path template/fonts --ignore-system-fonts \
  --input lang=en your-cv.typ your-cv.pdf
```

Typst reads the system font book once at process start, so `typst watch`
keeps a stale snapshot if installed fonts change underneath it — and an
unknown family is only a warning, leaving the build green with the wrong
typography. Vendoring the fonts and ignoring the system book makes output
identical on any machine and makes a missing face fail loudly.

## Licensing

`cv.typ` and this README: MIT, see `LICENSE`.

`fonts/`: **not** MIT. Spectral and Schibsted Grotesk are redistributed
unmodified under the SIL Open Font License 1.1 — see `fonts/README.md` and
the `*-OFL.txt` files beside them.
