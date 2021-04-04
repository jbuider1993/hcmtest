docker build -f Dockerfile -t hcm-service:$SHA .
docker tag hcm-service:$SHA jbuilder1993/hcm-service:$SHA
docker push jbuilder1993/hcm-service:$SHA
docker build -f Dockerfile -t hcm-service .
docker tag hcm-service jbuilder1993/hcm-service
docker push jbuilder1993/hcm-service

kubectl apply -f k8s
