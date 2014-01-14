RST_FILES = $(shell find . -not -name "README.rst" -name "*.rst")
HTML_FILES = $(RST_FILES:.rst=.html)

.PHONY: all

%.html : %.rst
	@echo 'Generating html presentation file for $<'
	@landslide -l table -i -r -t theme $< -d $@

all: clean $(HTML_FILES)

clean:
	@echo 'Removing old html presentation files.'
	rm -f $(HTML_FILES)
