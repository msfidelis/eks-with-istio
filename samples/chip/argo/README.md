
# Canary Release 

```bash
kubectl apply -f chip-istio-rollout-canary.yml
```

### Watch 

```bash
kubectl argo rollouts get rollout chip -n chip --watch
```

### Promote 


```bash
kubectl argo rollouts promote chip -n chip
```

### Abort

```bash
kubectl argo rollouts abort chip -n chip;
```

### Rollback

```bash
kubectl argo rollouts undo chip -n chip;
```