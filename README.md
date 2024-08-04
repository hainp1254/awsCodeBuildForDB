```bash
docker build --build-arg DB_PASSWORD=<DB_USERNAME> --build-arg DB_USERNAME=<DB_PASSWORD> .
```

```bash
docker run -p 5433:5432 <IMAGE_NAME>
```

aws eks update-kubeconfig --name eks-cluster


kubectl apply -f pvc.yaml
kubectl apply -f pv.yaml

[//]: # (kubectl apply -f db-configmap.yaml)

[//]: # (kubectl apply -f db-secret.yaml)
kubectl apply -f postgresql-deployment.yaml



# List the services
kubectl get svc

# Set up port-forwarding to `postgresql-service`
kubectl port-forward service/postgresql-service 5433:5432 &