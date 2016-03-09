# Docker image for i18ndude tool

[i18ndude](https://pypi.python.org/pypi/i18ndude) utility for translating Python and TAL template source code text strings.


## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.i18ndude/blob/master/Dockerfile)
- [`4.0.1` (*Dockerfile*)](https://github.com/eea/eea.docker.i18ndude/blob/4.0.1/Dockerfile)

## Usage

Default action `find-untranslated` messages: 

```console
$ docker run --rm -v /path/to/python/code:/code eeacms/i18ndude
```

## Advanced usage

### rebuild-pot

```console
$ docker run --rm \
             -v $(pwd)/src/eea.facetednavigation:/code \
             -w /code/eea/facetednavigation/locales \
         eeacms/i18ndude \
         rebuild-pot --exclude documentation --pot eea.pot --create eea ../../
```

### sync

```console
$ docker run --rm \
             -v $(pwd)/src/eea.facetednavigation:/code \
             -w /code/eea/facetednavigation/locales \
         eeacms/i18ndude sync --pot eea.pot */LC_MESSAGES/eea.po
         
```

See i18ndude `--help` for more options:

```console
$ docker run --rm eeacms/i18ndude --help
```
