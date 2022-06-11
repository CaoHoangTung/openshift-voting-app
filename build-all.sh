IMAGE_TAG=latest

docker build -t $IMAGE_REPO_NAME_VOTE ./voting-app/vote
docker build -t $IMAGE_REPO_NAME_RESULT ./voting-app/result
docker build -t $IMAGE_REPO_NAME_WORKER ./voting-app/worker

echo "Build done"

docker tag $IMAGE_REPO_NAME_VOTE:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_VOTE:$IMAGE_TAG
docker tag $IMAGE_REPO_NAME_RESULT:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_RESULT:$IMAGE_TAG
docker tag $IMAGE_REPO_NAME_WORKER:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_WORKER:$IMAGE_TAG

echo "Tag done"

docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_VOTE:$IMAGE_TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_RESULT:$IMAGE_TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME_WORKER:$IMAGE_TAG

echo "Pushed"