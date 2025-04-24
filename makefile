all: mkinst

builddir:
	rm -rf build
	mkdir -p build

installer: bootstrap
	cd src/installer && $(MAKE)

bootstrap: builddir
	cd src/image && $(MAKE)

mkinst: installer
	rm -rf installer
	mv build installer
