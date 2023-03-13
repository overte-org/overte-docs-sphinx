# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

BUILDGENERAL  = "$(SOURCEDIR)/developer/build/BUILD.md"
BUILDANDROID  = "$(SOURCEDIR)/developer/build/BUILD_ANDROID.md"
BUILDLINUX    = "$(SOURCEDIR)/developer/build/BUILD_LINUX.md"
BUILDOSX      = "$(SOURCEDIR)/developer/build/BUILD_OSX.md"
BUILDWIN      = "$(SOURCEDIR)/developer/build/BUILD_WIN.md"
INSTALLER     = "$(SOURCEDIR)/developer/INSTALLER.md"

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@echo "Downloading build documentation from main repository..."
		@echo "\nDownloading BUILD.md..."
		@curl --no-progress-meter --create-dirs -o $(BUILDGENERAL) https://raw.githubusercontent.com/overte-org/overte/master/BUILD.md
		@echo "Downloading BUILD_ANDROID.md..."
		@curl --no-progress-meter --create-dirs -o $(BUILDANDROID) https://raw.githubusercontent.com/overte-org/overte/master/BUILD_ANDROID.md
		@echo "Downloading BUILD_LINUX.md..."
		@curl --no-progress-meter --create-dirs -o $(BUILDLINUX) https://raw.githubusercontent.com/overte-org/overte/master/BUILD_LINUX.md
		@echo "Downloading BUILD_OSX.md..."
		@curl --no-progress-meter --create-dirs -o $(BUILDOSX) https://raw.githubusercontent.com/overte-org/overte/master/BUILD_OSX.md
		@echo "Downloading BUILD_WIN.md..."
		@curl --no-progress-meter --create-dirs -o $(BUILDWIN) https://raw.githubusercontent.com/overte-org/overte/master/BUILD_WIN.md
		@echo "Downloading INSTALLER.md..."
		@curl --no-progress-meter --create-dirs -o $(INSTALLER) https://raw.githubusercontent.com/overte-org/overte/master/INSTALLER.md
		@echo "\nFinished downloading build documentation from main repository."
	@echo -n "\nFixing paths... "
		@sed -i "s*(cmake/externals)*(https://github.com/overte-org/overte/tree/master/cmake/externals)*g" "$(BUILDGENERAL)"
		@sed -i "s*(cmake/modules/)*(https://github.com/overte-org/overte/tree/master/cmake/modules)*g" "$(BUILDGENERAL)"
		@sed -i "s*(interface/external)*(https://github.com/overte-org/overte/tree/master/interface/external)*g" "$(BUILDGENERAL)"
		@sed -i "s*(interface/external)*(https://github.com/overte-org/overte/tree/master/interface/external)*g" "$(BUILDGENERAL)"
		@sed -i "s*(BUILD.md)*(build/BUILD.md)*g" "$(INSTALLER)"
		@sed -i "s*(BUILD_OSX.md)*(build/BUILD_OSX.md)*g" "$(INSTALLER)"
		@sed -i "s*(tools/ci-scripts/deb_package/)*(https://github.com/overte-org/overte/tree/master/tools/ci-scripts/deb_package)*g" "$(INSTALLER)"
		@sed -i "s*(tools/ci-scripts/rpm_package/)*(https://github.com/overte-org/overte/tree/master/tools/ci-scripts/rpm_package)*g" "$(INSTALLER)"
		@echo "done"
	@echo "\nHanding over to sphinx-build."
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
