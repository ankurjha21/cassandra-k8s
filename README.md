# cassandra-k8s
Deploying Cassandra on kubernetes

## Setting up
If necessary change the Image or any other variable you can do so by changing the `deploy.sh` script. There are some common variables that are applied to all environments and they are handled by the functions `commonEnvsTest` and `commonEnvsProd`


## Deploying
Ir order to deploy a Datasink, make sure to apply the `exec` permission to `deploy.sh` and then run the script informing the environment `local|dev|staging|prod`:

```
chmod +x deploy.sh

bash deploy.sh prod
```
