K8S_VER ?= v1.5.1
TAG ?= t0mmyt

all: kubelet docker

clean:
	rm -f kubelet

docker:
	docker build --no-cache -t ${TAG}/kubelet:${K8S_VER} .

kubelet:
	curl -Ls https://dl.k8s.io/${K8S_VER}/kubernetes-server-linux-amd64.tar.gz |\
		tar zx --transform 's|.*/||' kubernetes/server/bin/kubelet

push:
	docker push ${TAG}/kubelet:${K8S_VER}
