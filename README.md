# Status

[![Master CI Deploy](https://readthedocs.org/projects/overte-docs/badge/?version=latest)](http://docs.overte.org/en/latest/?badge=latest) ![Master CI Warnings](https://github.com/overte-org/overte-docs-sphinx/actions/workflows/master_warnings.yml/badge.svg) ![Master CI Linkcheck](https://github.com/overte-org/overte-docs-sphinx/actions/workflows/master_linkcheck.yml/badge.svg)


# Overview of Overte's User Documentation Tools

For Overte's user documentation system, we use **Sphinx** to generate it, and *Read the Docs* to publish/host it. GitHub is a helpful middleman and stores all of the docs.

**Sphinx** is an open-source, robust solution for software documentation that includes features that writers expect, like:

* Single Source Publishing (HTML, PDF, ePub, and more)
* Content reuse through includes
* Multiple mature HTML themes that provide great user experience on mobile and desktop
* Referencing across pages, documents, and projects
* Index and Glossary support
* Localization support

Our main documentation is hosted at https://docs.overte.org.


## Translate

There are two ways to help with the translation of Overte's documentation:
* The recommended way is to use [Weblate](https://weblate.overte.org/projects/overte/overte-documentation/).
* You can also submit updated `.po` files via a pull request.

Please contact Julian Groß or open an issue if you want to translate a language that is not in the system yet.


## Building the documentation
### Linux

We do almost everything inside a Python virtual environment since not all dependencies are available outside of pip.
In this example, we will create and use the virtual environment in a hidden `.venv` path.

#### Install basic dependencies

```bash
sudo apt install git python3-venv make
```


#### Clone repository

```bash
git clone https://github.com/overte-org/overte-docs-sphinx.git
```


#### Prepare the virtual environment

1. Create a virtual Python3 environment
    ```bash
    cd overte-docs-sphinx
    python3 -m venv .venv
    ```

2. Install Sphinx and dependencies
    ```bash
    .venv/bin/pip3 install -r requirements.txt
    ```


#### Build the documentation

```bash
.venv/bin/venv-run make html
```
Keep in mind that Sphinx will not rebuild files that haven't been changed, and therefore not throw warnings about those files.
Run `.venv/bin/venv-run make SPHINXOPTS="-E" html` instead if you want to regenerate everything.
The HTML output will be in `build\html`. Open `home.html` in a browser to view the docs.


#### Build different languages (optional)

To compile a different language you need an additional set of commands:
1. Create gettext files
    ```bash
    .venv/bin/venv-run make gettext
    ```

2. Create/update to `.po` translation files
    Replace `xX` with your [language code](https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-language)
    ```bash
    .venv/bin/sphinx-intl update -p build/gettext -d source/locales -l xX
    ```

3. Build the selected language
    ```bash
    .venv/bin/venv-run make SPHINXOPTS="-Dlanguage=xX" html
    ```


### Windows

**Note:** You will need git installed and available to your `cmd`.

1. Run `cmd` as an administrator.
2. Install Chocolatey via the `cmd` (on one line):

    ```bat
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    ```
    If you run into any problems with this command, please take a look at https://github.com/chocolatey/choco/wiki/Troubleshooting

3. Install Python 3 via Chocolatey via `cmd`:

    ```bat
    C:\> choco install python
    ```

4. Restart `cmd` as an admin or refresh with the command:

    ```bat
    C:\> refreshenv
    ```
5. Install all requirements:

    ```bat
    C:\> pip install -r requirements.txt
    ```

6. Run the `make.bat` to build the documentation.

    The HTML output will be in build\html. Open home.html in a browser to view the docs.


## Add new languages

Generate the new language strings (see operating system specific instructions above):
- `make gettext`
- `sphinx-intl update -l xx` (xx being the sphinx language code)

New languages need to be manually added in a number of locations, so the users can select between them and they can be automatically deployed.
The locations include:
- .github/workflows/master_build.yml
- .github/workflows/master_warnings.yml
- source/home.rst
- source/_templates/versions.html
- https://readthedocs.org/projects/overte-docs/


## Using RST

Most of our docs use RST. reStructuredText (RST) is the default plaintext markup language used by Sphinx. It is an extensible markup language, that is fully customizable. To learn more, refer to Sphinx's [reStructuredText Primer](https://www.sphinx-doc.org/en/2.0/usage/restructuredtext/basics.html).
RST should be used for any real documentation, as Markdown only supports very basic directives.
The MyST parser expands Markdown significantly, but RST should still be preferred as writers and translators would need to learn two big markup languages instead of just one.
A valuable resource for RST is the [official documentation](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html).


## Using videos

The `muted` property is needed for autoplay to work in Chrome.


### Format & Conversion

When adding videos to the documentation, it is important to use H.264 *and* VP9 to ensure that they can be played in all major web browsers.

To convert videos and animated images to VP9 you can use following command in ffmpeg:

```bash
ffmpeg -i INPUTFILE -c:v libvpx-vp9 -b:v 0 -crf 5 -vf "scale=-2:'min(600,ih)'" -cpu-used 5 -row-mt 1 -c:a libopus -b:a 96K _static/videos/OUTPUTFILE.webm
```

And to convert to H.264:

```bash
ffmpeg -i INPUTFILE -c:v libx264 -b:v 0 -crf 18 -vf "scale=-2:'min(600,ih)'" -c:a libfdk_aac -b:a 96K _static/videos/OUTPUTFILE.mp4
```
