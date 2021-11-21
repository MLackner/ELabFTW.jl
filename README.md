# ELabFTW

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://MLackner.github.io/ELabFTW.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://MLackner.github.io/ELabFTW.jl/dev)
[![Build Status](https://github.com/MLackner/ELabFTW.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/MLackner/ELabFTW.jl/actions/workflows/CI.yml?query=branch%3Amaster)

## Setup

Get API token from User Control Panel in eLabFTW. Go to "API KEYS". Enter a name and set "Permissions" to "Read/Write". Click "Generate an API Key". Your API key will be shown.

### Windows

In the "Environment Variables" settings create a new User Variable with the name `ELABFTW_API_KEY` with the API key as the variable value.

To set the endpoint to which all the API requests should go again set a new User Variable with name `ELABFTW_ENDPOINT` and the URL pointing to your eLabFTW server as value (For example `https://demo.elabftw.net/api/v1/`). 