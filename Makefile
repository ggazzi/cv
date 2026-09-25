# Typst reads the system font book once, at process start. A running
# `typst watch` therefore keeps a stale snapshot if the installed fonts change
# underneath it, and silently falls back to a serif for the whole sans layer --
# an unknown font family is only a warning, and the build still exits 0.
#
# So the fonts are vendored in template/fonts/ and the system book is ignored entirely.
# Output is then identical on any machine, and a missing face fails loudly
# instead of quietly resetting the typography.
TYPST_FLAGS = --font-path template/fonts --ignore-system-fonts

SOURCE = guilherme-azzi.typ

# One source, two languages: the language is passed in and every localisable
# string in the source is an (en:, de:) dictionary.
LANG_CODE ?= en
OUT_en = guilherme-azzi.en.pdf
OUT_de = guilherme-azzi.de.pdf

build: $(OUT_en) $(OUT_de)

$(OUT_en): $(SOURCE) template/cv.typ
	typst compile $(TYPST_FLAGS) --input lang=en $(SOURCE) $@

$(OUT_de): $(SOURCE) template/cv.typ
	typst compile $(TYPST_FLAGS) --input lang=de $(SOURCE) $@

# make watch LANG_CODE=de
watch:
	typst watch $(TYPST_FLAGS) --input lang=$(LANG_CODE) $(SOURCE) $(OUT_$(LANG_CODE))

.PHONY: build watch
