FROM chainguard/wolfi-base
# TARGETARCH is amd64 or arm, chainctl is x86_64 or aarch64 Doh.
# ARG TARGETARCH 
ADD --chmod=755 --chown=root https://dl.enforce.dev/chainctl/latest/chainctl_linux_x86_64 /usr/local/bin/chainctl
RUN apk update
RUN apk add helm docker docker-dind docker-credential-ecr-login aws-cli \
    kubectl-latest git git-lfs gitsign make terraform curl coreutils

