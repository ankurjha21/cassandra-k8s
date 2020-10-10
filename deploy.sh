#!/bin/bash


usage(){
    echo "Usage: ${0} dev|prod"
}

# --------------------
#  Setting / Exporting variables
# --------------------
PROJECT="ankur-prod"
CASSANDRA_CLUSTER_NAME="ankur"
ENVIRONMENT=${1}

echo "Applying ${ENVIRONMENT} SVC"
cat svc.yml | \
    sed "s/\${ENVIRONMENT}/${ENVIRONMENT}/g" | \
    kubectl apply -f -

echo "Applying ${ENVIRONMENT} deployment"
cat statefulset.yml | \
    sed "s/\${ENVIRONMENT}/${ENVIRONMENT}/g" | \
    sed "s/\${CASSANDRA_CLUSTER_NAME}/${CASSANDRA_CLUSTER_NAME}/g" | \
    sed "s/\${PROJECT}/${PROJECT}/g" | \
    kubectl apply -f -
