# Operation
This is the operation repository of group 13. Here you will find relevant links and material for executing and understanding our work. First, there are instructions on different ways of running the project. At the bottom, there are notes about each assignment.

## Repos
- [model-training](https://github.com/Release-Engineering-Group-13/model-training)
- [lib-ml](https://github.com/Release-Engineering-Group-13/lib-ml)
- [model-service](https://github.com/Release-Engineering-Group-13/model-service)
- [lib-version](https://github.com/Release-Engineering-Group-13/lib-version)
- [app](https://github.com/Release-Engineering-Group-13/app)

## How to run with docker-compose:
0. If the trained model has not been downloaded yet, install ellipsis and fetch the model. Otherwise, ignore this step
    ```bash
    pip install ellipsis
    python fetch_model.py
    ```
1. Pull and run the images 
     ```bash
    docker-compose up
    ```
2. Access the frontend through at [localhost:5000](http://localhost:5000) to make a request to the model-service. You can also access the (interactive) model service API documentation through [localhost:8080/apidocs](http://localhost:8080/apidocs).

## How to run kubernetes:
1. install kubectl and minikube
    ```bash
    brew install kubectl
    brew install minikube
    ```
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
2. Run the following command to start the VMs
    ```bash
    vagrant up
    ```
3. Run the following command
    ```bash
    vagrant up
    ```
4. Access the frontend through at [localhost:5000](http://localhost:5000) to make a request to the model-service. You can also access the model-service through [localhost:8080/apidocs](http://localhost:8080/apidocs).

## Assignment 1
Everything that was needed is implemented. See the [model-training repository](https://github.com/Release-Engineering-Group-13/model-training).

Link to elaboration on code quality: [codequality.md](Assignment%201/codequality.md) 

## Assignment 2
With the way we fetch the model (by downloading it when starting the model-service container), we didn't have a need for a volume mount in the docker-compose.

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

## Assignment 5
Submission file: [submission_a5.md](submission%20files/submission_a5.md)

Added Istio 
Added environment veriables to the app frontend and backend
Kubernetes progress update
