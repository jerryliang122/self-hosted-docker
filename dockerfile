FROM ubuntu:22.04
RUN apt-get update && apt-get install -y git git-lfs curl sudo &&\
    mkdir actions-runner &&\
    useradd -m github && \
    chown github:github -R /actions-runner &&\
    chmod 777 /actions-runner &&\
    echo 'github ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers 
USER github
WORKDIR /actions-runner
COPY start.sh /actions-runner
RUN curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz &&\ 
    echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c &&\ 
    tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz
CMD [ "bash", "start.sh" ]
