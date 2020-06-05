SVC=go-k8s
REPO=agolebiowska/go-k8s
TIMESTAMP=tmp-$(shell date +%s )
VERSION=v1
DFILE=k8s.yml

# Builds the local image, then uses that image
# to create a deployment which is exposed as service
.PHONY: create
create:
	@eval $$(minikube docker-env) ;\
	docker image build -t $(REPO):v1 -f Dockerfile .
	kubectl apply -f $(DFILE)
	kubectl expose deployment $(SVC) --type=NodePort --port=8080
	kubectl describe deployment $(SVC)

# Creates a time stamped version of the image
# and update the deployment to use this new image
.PHONY: update
update:
	@eval $$(minikube docker-env) ;\
	docker image build -t $(REPO):$(TIMESTAMP) -f Dockerfile .
	kubectl set image deployment/$(SVC) *=$(REPO):$(TIMESTAMP)

# Deletes deployment & service
.PHONY: delete
delete:
	kubectl delete deployment,service $(SVC)

# Builds new image and pushes it to docker.io
.PHONY: push
push: build
	docker tag $(REPO):$(VERSION) $(REPO):latest
	docker push $(REPO):$(VERSION)
	docker push $(REPO):latest

# Builds new image
build:
	@eval $$(minikube docker-env -u);\
	docker image build -t $(REPO):$(VERSION) -f Dockerfile .

# Opens service in default browser
.PHONY: open
open:
	minikube service go-k8s

# Lists pods, services & deployments
.PHONY: list
list:
	kubectl get pods
	kubectl get svc
	kubectl get deployments
