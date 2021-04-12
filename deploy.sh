openssl aes-256-cbc -K $encrypted_936fc812f2a8_key -iv $encrypted_936fc812f2a8_iv -in googlegcpaccount.json.enc -out googlegcpaccount.json -d
gcloud version || true
if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then rm -rf $HOME/google-cloud-sdk; export CLOUDSDK_CORE_DISABLE_PROMPTS=1; curl https://sdk.cloud.google.com | bash; fi
source /home/travis/google-cloud-sdk/path.bash.inc
gcloud version
gcloud components update kubectl
gcloud auth activate-service-account --key-file googlegcpaccount.json
gcloud config set project abstract-dragon-284619
gcloud config set compute/zone us-central1-c
gcloud container clusters get-credentials cluster-1
kubectl apply -f k8s
kubectl set image deployment/users-deployment users=jbuilder1993/hcm-service:$SHA


