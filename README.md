# Osakana

[![Gem Version](https://badge.fury.io/rb/osakana.svg)](https://badge.fury.io/rb/osakana)
[![Build Status](https://travis-ci.org/ninoseki/osakana.svg?branch=master)](https://travis-ci.org/ninoseki/osakana)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/osakana/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/osakana?branch=master)

Osakana is a Swiss army knife tool for my phishing research.

## Features

- Lookup supports:
  - [Ayashige](https://github.com/ninoseki/ayashige) lookup
  - Censys lookup
  - DNPedia (newly registered domains) lookup
  - urlscan.io lookup
- IoC enrichment:
  - SecurityTrails integration (an API Key is required)
  - Robtex integration
- Notification:
  - Slack notification

## Prerequisites

- Ruby (> 2.5)

## Install

```shell
gem install osakana
```

## Usage

```shell
$ osakana
Commands:
  osakana ayashige_lookup [KEYWORD]      # lookup on Ayashige by a given keyword
  osakana censys_lookup [QUERY]          # lookup on Censys by a given query
  osakana check_newly_domains [KEYWORD]  # check newly registered domains on DNPedia by a given keyword
  osakana help [COMMAND]                 # Describe available commands or one specific command
  osakana urlscan_lookup [QUERY]         # look up on urlscan.io by a given query
```

## Configuration

### Censys

Please set the following environmental variables for enabling Censys lookup.

- `CENSYS_ID`: your Censys API ID
- `CENSYS_SECRET`: your Censys secret key

### SecurityTrails

Please set the following environmental variable for enabling SecurityTrails integration.

- `SECURITYTRAILS_API_KEY`: your SecurityTrails API key

### Slack

Please set the following environmental variables for enabling Slack notification.

- `SLACK_WEBHOOK_URL`: A Slack webhook URL.
- `SLACK_CHANNEL_NAME`: A Slask channel name which will be notified.

## Screenshots

### `osakana censys_lookup`

![censys](./screenshots/censys.png)

### `osakana check_newly_domains`

![dnpedia](./screenshots/dnpedia.png)
