#!/bin/zsh

GIT_COMMIT_ID=$(git log --format="%H" -n 1)
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com
docker build -t tfpractice-next:"${GIT_COMMIT_ID}" -f Dockerfile.prod .
docker tag tfpractice-next:"${GIT_COMMIT_ID}" 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com/tfpractice-next:"${GIT_COMMIT_ID}"
docker push 412335340103.dkr.ecr.ap-northeast-1.amazonaws.com/tfpractice-next:"${GIT_COMMIT_ID}"
