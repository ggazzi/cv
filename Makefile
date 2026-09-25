# Typst reads the system font book once, at process start. A running
# `typst watch` therefore keeps a stale snapshot if the installed fonts change
# underneath it, and silently falls back to a serif for the whole sans layer --
# an unknown font family is only a warning, and the build still exits 0.
#
# So the fonts are vendored in fonts/ and the system book is ignored entirely.
# Output is then identical on any machine, and a missing face fails loudly
# instead of quietly resetting the typography.
TYPST_FLAGS = --font-path fonts --ignore-system-fonts

SOURCE = guilherme-azzi.typ

build:
	typst compile $(TYPST_FLAGS) $(SOURCE)

watch:
	typst watch $(TYPST_FLAGS) $(SOURCE)

.PHONY: build watch
