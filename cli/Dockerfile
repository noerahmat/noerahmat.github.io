FROM alpine
ENV REGISTRY01_URL=registry01.loyalto.id
ENV REGISTRY01_USER=mamat
ENV REGISTRY01_PASSWORD=pwlpi123
RUN apk --update add curl git less zsh-vcs vim openssh bash jq docker openrc make coreutils && \
    curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
    
RUN rc-update add docker boot 

# Uses "Spaceship" theme with some customization. Uses some bundled plugins and installs some more from github
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
#     -t https://github.com/denysdovhan/spaceship-prompt \
#     -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
#     -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
#     -p git \
#     -p ssh-agent \
#     -p https://github.com/zsh-users/zsh-autosuggestions \
#     -p https://github.com/zsh-users/zsh-completions


VOLUME /cicd
WORKDIR /cicd

COPY bin /usr/local/bin
COPY html.tpl /html.tpl
RUN chmod -R +x /usr/local/bin/

# ENTRYPOINT ["git"]
# CMD ["--help"]