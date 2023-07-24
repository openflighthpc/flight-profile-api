# Flight Profile API

A REST API to manage node deployments with `flight-profile`.

## Overview

Flight Profile API is a REST API that provides web access to the Flight Profile command line tool. 

## Installation

### From the OpenFlight package repos

Flight Profile API is available from the OpenFlight package repositories. This is the easiest way to install it, and there will be no extra configuration required, assuming you have also installed Flight Profile from the OpenFlight package repos.

### Manual installation

#### Prerequisites

Flight Profile API is developed and test with Ruby version `2.7.1` and Bundler `2.1.4`. Other versions may work but are not currently supported.

Flight Profile API requires Flight Profile, which can be installed by following the [Flight Profile installation instructions](https://github.com/openflighthpc/flight-profile/blob/master/README.md#installation).

#### Install Flight Profile API

The following will install from source using `git`. The master branch is the current development version and may not be appropriate for a production installation. Instead a tagged version should be checked out.

```
git clone https://github.com/openflighthpc/flight-profile-api.git
cd flight-profile-api
git checkout <tag>
bundle install
```

## Configuration

Flight Profile API comes preconfigured to work out of the box without further configuration. However, it is likely that you will want to change its `bind_address`. Please refer to the configuration file for more details and a full list of configuration options.

## Operation

The service can be started by running:

```
bin/puma
```

See bin/puma --help for more help including how to set a pid file and how to redirect logs.

# Contributing

Fork the project. Make your feature addition or bug fix. Send a pull request. Bonus points for topic branches.

Read [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

# Copyright and License

Eclipse Public License 2.0, see LICENSE.txt for details.

Copyright (C) 2023-present Alces Flight Ltd.

This program and the accompanying materials are made available under the terms of the Eclipse Public License 2.0 which is available at https://www.eclipse.org/legal/epl-2.0, or alternative license terms made available by Alces Flight Ltd - please direct inquiries about licensing to licensing@alces-flight.com.

Flight Profile API is distributed in the hope that it will be useful, but WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. See the Eclipse Public License 2.0 for more details.
