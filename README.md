# Docker image for i18ndude tool

[i18ndude](https://pypi.python.org/pypi/i18ndude) utility for translating Python and TAL template source code text strings.


## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.i18ndude/blob/master/Dockerfile)
- [`4.3.2` (*Dockerfile*)](https://github.com/eea/eea.docker.i18ndude/blob/4.3.2/Dockerfile)
- [`4.3.1` (*Dockerfile*)](https://github.com/eea/eea.docker.i18ndude/blob/4.3.1/Dockerfile)

## Usage

Default action `find-untranslated` messages:

    $ docker run --rm -v /path/to/python/code:/code eeacms/i18ndude

or

    $ docker run --rm eeacms/i18ndude https://github.com/eea/eea.alchemy.git

## Running in jenkins, including pull requests:

* GIT_NAME, GIT_SRC  - must be given
* GIT_BRANCH - defaults to master
* GIT_CHANGE_ID - can be empty or pull request id

    $ docker run -i --rm -e GIT_SRC="https://github.com/eea/$GIT_NAME.git" -e GIT_NAME="$GIT_NAME" -e GIT_BRANCH="$BRANCH_NAME" -e GIT_CHANGE_ID="$CHANGE_ID" eeacms/i18ndude


## Advanced usage

### rebuild-pot


    $ docker run --rm \
                 -v $(pwd)/src/eea.facetednavigation:/code \
                 -w /code/eea/facetednavigation/locales \
             eeacms/i18ndude \
             i18ndude rebuild-pot --exclude documentation --pot eea.pot --create eea ../../

or (if `update.sh` script is present within repo)


    $ docker run --rm \
                 -v $(pwd)/src/eea.facetednavigation:/code \
                 -w /code/eea/facetednavigation/locales \
             eeacms/i18ndude ./update.sh

### sync


    $ docker run --rm \
                 -v $(pwd)/src/eea.facetednavigation:/code \
                 -w /code/eea/facetednavigation/locales \
             eeacms/i18ndude i18ndude sync --pot eea.pot */LC_MESSAGES/eea.po


See i18ndude `--help` for more options:


    $ docker run --rm eeacms/i18ndude --help
