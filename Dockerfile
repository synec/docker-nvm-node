# Use ubuntu trusty tar (14.04 LTS) as base image
FROM synec/nvm

MAINTAINER Daniel Grabert <docker@synec.de>

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Define node version
ENV NODE_VERSION=4.4.3

ENV NVM_DIR=/root/.nvm

# Fetch and install nodejs via nvm
RUN source $NVM_DIR/nvm.sh \
      && nvm install $NODE_VERSION \
      && nvm alias default $NODE_VERSION \
      && nvm use default

# Export NODE_PATH
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
# Update PATH to make node/npm accessible
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
