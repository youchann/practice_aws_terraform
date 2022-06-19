#!/bin/zsh

GIT_COMMIT_ID=$(git log --format="%H" -n 1)
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com
docker build -t tfpractice-nginx:"${GIT_COMMIT_ID}" -f ./infra/web/Dockerfile .
docker tag tfpractice-nginx:"${GIT_COMMIT_ID}" 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com/tfpractice-nginx:"${GIT_COMMIT_ID}"
docker push 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com/tfpractice-nginx:"${GIT_COMMIT_ID}"
