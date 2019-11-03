# build images
docker build -t kumar003vinod/multi-client:latest -t kumar003vinod/multi-client:$GIT_SHA -f ./client/Dockerfile ./client/
docker build -t kumar003vinod/multi-server:latest -t kumar003vinod/multi-server:$GIT_SHA -f ./server/Dockerfile ./server/
docker build -t kumar003vinod/multi-worker:latest -t kumar003vinod/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker/
# push images
docker push kumar003vinod/multi-client:latest
docker push kumar003vinod/multi-server:latest
docker push kumar003vinod/multi-worker:latest
docker push kumar003vinod/multi-client:$GIT_SHA
docker push kumar003vinod/multi-server:$GIT_SHA
docker push kumar003vinod/multi-worker:$GIT_SHA
# apply changes in cluster
kubectl apply -f k8s
# make containers use latest image
kubectl set image deployment/client-deployment client=kumar003vinod/multi-client:$GIT_SHA
kubectl set image deployment/server-deployment server=kumar003vinod/multi-server:$GIT_SHA
kubectl set image deployment/worker-deployment worker=kumar003vinod/multi-worker:$GIT_SHA
