#-----------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See LICENSE in the project root for license information.
#-----------------------------------------------------------------------------------------

FROM node:10

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends apt-utils 2>&1

COPY . .

# Verify git and process tools are installed
RUN apt-get install -y git procps

# # Remove outdated yarn from /opt and install via package 
# # so it can be easily updated via apt-get upgrade yarn
# RUN rm -rf /opt/yarn-* \
#     && rm -f /usr/local/bin/yarn \
#     && rm -f /usr/local/bin/yarnpkg \
#     && apt-get install -y curl apt-transport-https lsb-release \
#     && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
#     && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#     && apt-get update \
#     && apt-get -y install --no-install-recommends yarn

# # Clean up
# RUN apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash rather than sh
ENV SHELL /bin/bash

# Download source code
RUN chmod +x ./start.sh

CMD ./start.sh