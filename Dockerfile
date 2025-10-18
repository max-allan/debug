FROM chainguard/wolfi-base
RUN apk update && apk add helm docker-dind docker-credential-ecr-login aws-cli kubectl-latest
# TARGETARCH is amd64 or arm
ADD --chmod=755 --chown=root https://dl.enforce.dev/chainctl/latest/chainctl_$TARGETARCH /usr/local/bin/chainctl