NAMESPACE=namespace-terraform

minikube-start:
	minikube start --memory 2056 --cpus 2 --driver=virtualbox
	@make minikube-addons

minikube-addons:
	minikube addons enable ingress
	minikube addons enable metrics-server

minikube-status:
	minikube status

minikube-dashboard:
	minikube dashboard

minikube-stop:
	minikube stop

terraform-init:
	terraform init

terraform-destroy:
	terraform destroy

dev-watch:
	watch kubectl get namespaces,all,secrets,configmap,ingress -n dev-$(NAMESPACE)

prod-watch:
	watch kubectl get namespaces,all,secrets,configmap,ingress -n prod-$(NAMESPACE)

dev-terraform-plan:
	terraform workspace select dev
	terraform plan -var-file=dev.tfvars

dev-terraform-apply:
	terraform workspace select dev
	terraform apply -var-file=dev.tfvars

dev-terraform-destroy:
	terraform workspace select dev
	@make terraform-destroy

prod-terraform-plan:
	terraform workspace select prod
	terraform plan -var-file=prod.tfvars

prod-terraform-apply:
	terraform workspace select prod
	terraform apply -var-file=prod.tfvars

prod-terraform-destroy:
	terraform workspace select prod
	@make terraform-destroy

logs-pod:
	kubectl logs -f $(shell kubectl get pods -n dev-$(NAMESPACE) -o jsonpath='{.items[0].metadata.name}') -n dev-$(NAMESPACE)

bash-pod:
	kubectl exec -it $(shell kubectl get pods -n dev-$(NAMESPACE) -o jsonpath='{.items[0].metadata.name}') -n dev-$(NAMESPACE) -- bash

# terraform workspace new prod
# terraform workspace new dev