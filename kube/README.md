`kubectl apply -f database.yaml` - database


# Pushing into YC (registry)
```
docker tag custom-postgres \
cr.yandex/crpo7tdod3sj8k3of2r6/taskbot-db:latest

docker push \
cr.yandex/crpo7tdod3sj8k3of2r6/taskbot-db:latest
```

# Useful:
```
kubectl apply -f taskbot.yaml

kubectl get pods -n timofeev-ns

kubectl logs -l app=timofeev-bot -n timofeev-ns --tail=100

kubectl exec -it <pod> -n timofeev-ns -- \
  sh -c "apt-get update && apt-get install -y postgresql-client && \
  psql -h db -U postgres -d tasks -c '\dt'"

kubectl delete -f database.yaml -f taskbot.yaml
```