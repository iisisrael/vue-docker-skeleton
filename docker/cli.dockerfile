# Using the debian version rather than alpine, cuz bash and stuff
FROM node:21.2

WORKDIR /vue-cli

RUN npm install -g @vue/cli

# The following commands ensure access to our files
# If we left them out, changing files on our local setup
# would fail due to insufficient permissions. 
RUN userdel -r node

ARG USER_ID

ARG GROUP_ID

RUN getent group $GROUP_ID || addgroup --gid $GROUP_ID user

RUN getent passwd $USER_ID || adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

# Set the active user and open the interactive terminal
USER user

ENTRYPOINT [ "bash" ]
