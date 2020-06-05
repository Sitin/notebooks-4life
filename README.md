Notebooks for Life
==================

Jupyter notebooks for various tasks.

Install
-------

### Local Installation

Make sure that ZeroMQ is installed:

```shell script
brew install zeromq
```

Setup Python virtual environment:

```shell script
mkvirtualenv notebooks --python=<path to Python 3.8>
```

Install Python requirements:

```shell script
pip install -r requirements.txt
```

Install Jupyter Widgets

```shell script
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter nbextension enable --py --sys-prefix qgrid
```

Make sure that you are running Node.js 12.16.1:

```shell script
nvm use 12.16.1
```

Install Configurable HTTP Proxy (for Jupyter Hub):

```shell script
npm install -g configurable-http-proxy
```

Install Jupyter Lab extensions:

```shell script
jupyter labextension install @jupyter-widgets/jupyterlab-manager qgrid2 jupyter-matplotlib @krassowski/jupyterlab-lsp
```

> #### Note:
> We use `@8080labs/qgrid` instead of `qgrid2` due to the [bug](https://github.com/quantopian/qgrid/issues/264) with
> qgrid in the latest Jupyter Lab.

Make sure that you have R >= 3.6. Then install `IRkernel`:

```shell script
Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel', 'languageserver'), type = 'source', repos='http://cran.r-project.org')"
```

And attach it to Jupyter:

```shell script
Rscript -e "IRkernel::installspec()"
```

Use `IRkernel::installspec(user = FALSE)` for global installation.

### Install with Docker

Create `.env` file from template:

```shell script
make create-dotenv
```

And configure secrets.

Build docker image:

```shell script
make docker-build
```

Running
-------

### Run locally

Jupyter Lab:

```shell script
make lab
```

Jupyter Notebook:

```shell script
make notebook
```

Jupyter Hub:

```shell script
make hub
```

### Run with Docker

This will run a default notebook server:

```shell script
make docker-up
```
