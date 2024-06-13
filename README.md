# Operation
This is the operation repository of group 13. Here you will find relevant links and material for executing and understanding our work. 

## How to run docker-compose:
0. If the trained model has not been downloaded yet, install ellipsis and fetch the model. Otherwise, ignore this step
    ```bash
    pip install ellipsis
    python fetch_model.py
    ```
1. Pull and run the images 
     ```bash
    docker-compose up
    ```
2. Access the frontend through at [localhost:5000](http://localhost:5000) to make a request to the model-service. You can also access the model-service through [localhost:8080/apidocs](http://localhost:8080/apidocs).

## How to run kubernetes:
1. install kubectl and minikube
    '''bash
    brew install kubectl
    brew install minikube
    '''
2. Start minikube
    ```bash
    minikube start
    ```
3. Apply the kubernetes configuration
    ```bash
    kubectl apply -f kubernetes.yml
    ```
4. Access the frontend through at [localhost:5000](http://localhost:5000) to make a request to the model-service. You can also access the model-service through [localhost:8080/apidocs](http://localhost:8080/apidocs).

## How to run vagrant
1. Install vagrant and virtualbox
    ```bash
    brew install vagrant
    brew install virtualbox
    ```
2. Run the following command
    ```bash
    vagrant up
    ```
3. Access the frontend through at [localhost:5000](http://localhost:5000) to make a request to the model-service. You can also access the model-service through [localhost:8080/apidocs](http://localhost:8080/apidocs).


## Repos
**DISCLAIMER:** These are not the repos to look at for the review process; instead use the links provided in the submission file. This is because some of the features are not in the main branch yet, while the links below point only to there.
- [model-training](https://github.com/Release-Engineering-Group-13/model-training)
- [lib-ml](https://github.com/Release-Engineering-Group-13/lib-ml)
- [model-service](https://github.com/Release-Engineering-Group-13/model-service)
- [lib-version](https://github.com/Release-Engineering-Group-13/lib-version)
- [app](https://github.com/Release-Engineering-Group-13/app)

## Activity
The required document with at least one created and one reviewed PR is [ACTIVITY.md](https://github.com/Release-Engineering-Group-13/operation/blob/main/ACTIVITY.md)

## Assignment 1
Submission file: [submission_a1.md](submission%20files/submission_a1.md) \
Link to code repository: [Assignment 1](https://github.com/Release-Engineering-Group-13/CS4295_FinalProject/tree/a1).

Everything that was needed is implemented

Link to elaboration on code quality: [codequality.md](Assignment%201/codequality.md) 

## Assignment 2
Submission file: [submission_a2.md](submission%20files/submission_a2.md)

- operation has a docker-compose
- model-training has removed the preprocessing, and uses pylint/dslinter and flake8 in a workflow.
- lib-ml is completely done as requested
- model-service is working fully
- lib-version works too
- app is currently not working yet

## Assignment 3
Submission file: [submission_a3.md](submission%20files/submission_a3.md)

We did not have a lot of time, so for this assignment specifically there is not a lot. \
We did not really figure out how to deploy a kubernetes, so any hints on that would be very welcome!

- A basic Vagrantfile was set up in the operation repo that initializes the 3 VMs
- An initial kubernetes.yml is made that does the same as the docker-compose, but it just runs on the host machine.

## Assignment 4
Submission file: [submission_a4.md](submission%20files/submission_a4.md)

The tests are added
We finished the app from assignment 2

- A basic Vagrantfile was set up in the operation repo that initializes the 3 VMs
- An initial kubernetes.yml is made that does the same as the docker-compose, but it just runs on the host machine.
