FROM chainguard/wolfi-base
RUN apk update && apk add helm docker-dind docker-credential-ecr-login aws-cli kubectl-latest
# TARGETARCH is amd64 or arm, chainctl is x86_64 or aarch64 Doh.
# ARG TARGETARCH 
ADD --chmod=755 --chown=root https://dl.enforce.dev/chainctl/latest/chainctl_linux_x86_64 /usr/local/bin/chainctl