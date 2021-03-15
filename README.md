# hcmtest

# HCM
HCM development
https://github.com/yahoo/elide
https://github.com/IBM/java-microprofile-fault-monitoring

deploy In Linux

git clone https://github_token@github.com/jbuider1993/HCM.git
cd ./HCM
export SHA=$(git rev-parse HEAD)
export CLOUDSDK_CORE_DISABLE_PROMPTS=1
mvn clean install
docker login -u docker_user -p password
docker build -f Dockerfile -t hcm-service:$SHA .
docker tag hcm-service:$SHA jbuilder1993/hcm-service:$SHA
docker push jbuilder1993/hcm-service:$SHA

docker build -f Dockerfile -t hcm-service .
docker tag hcm-service jbuilder1993/hcm-service
docker push jbuilder1993/hcm-service


1) GCP platform:
- gcloud components update kubectl
// - gcloud auth activate-service-account --key-file service-account.json
- gcloud config set project abstract-dragon-284619
- gcloud config set compute/zone us-central1-c
- gcloud container clusters get-credentials cluster-1

2) Install Ingress service
  1) install helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
	
 kubectl create serviceaccount --namespace kube-system tiller
  //tiller is serviceaccount name
  //when assign it a Role should using namespace:name
  //when using it can direct using the 'name'
  kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller  
  ??? kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'  
  helm init --service-account tiller --upgrade
		
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install my-release ingress-nginx/ingress-nginx

3) app deploy
   upload *.yaml
   kubectl apply -f ./
4) GCP Create service account:
   I AM --> service account ---> create account ---> key-tab "add key"
5) Traivs GCP decode service account json
   docker run -it -v $(pwd):/app ruby:2.3 sh  --copy the serviceaccount.json to host current folder in the docker container mapping ot /app
   gem install travis --no-rdoc --no-ri
   travis login --github-token YOUR_PERSONAL_TOKEN --pro  //github token
   //travis encrypt-file service-account.json -r USERNAME/REPO --pro
   travis encrypt-file service-account.json -r jbuilder1993@gmail.com/hcm  --pro //github project
   
https://app-hcmtest.herokuapp.com/users
