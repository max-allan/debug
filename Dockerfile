FROM chainguard/wolfi-base
# TARGETARCH is amd64 or arm, chainctl is x86_64 or aarch64 Doh.
# ARG TARGETARCH 
ADD --chmod=755 --chown=root https://dl.enforce.dev/chainctl/latest/chainctl_linux_x86_64 /usr/local/bin/chainctl
RUN apk update
RUN apk add helm docker docker-dind dockerd-oci-entrypoint dockerd docker-credential-ecr-login aws-cli \
    kubectl-latest git git-lfs gitsign make terraform curl coreutils mount openssh-server s3fs-fuse

RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
RUN mkdir -p /root/.ssh
COPY <<EOF /root/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJX8df1Cc6jeumgm6vGhksOya15IWaEBb2VxNFh2K+15
EOF
RUN echo "max-csi /data fuse.s3fs _netdev,allow_other,nofail 0 0" >> /etc/fstab

ENTRYPOINT ["sleep", "infinity"]