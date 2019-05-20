# Kubernetes utilities

This repository defines a docker image with some basic utilities that can be useful in a kubernetes environment.

# Wait for service

If you have a container needs relies on a service to be available before it can start you will need to wait. This can be done by using an _init container_ that monitors the endpoints for a service.

Here is a quick example that shows how you can wait for a service named `postgresql` to be up and running before starting:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  initContainers:
    - name: wait-for-postgresql
        image: crypho.azurecr.io/crypho/k8s-tools:1.0.0
        args: wait-for-service postgresql
  containers:
    - name: myapp-cotainer
      ...
```