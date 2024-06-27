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
    minikube start --driver=docker
    ```
3. Apply the kubernetes configuration
    ```bash
    kubectl apply -f kubernetes.yml
    ```
4. Tunnel minikube
    ```bash
    minikube tunnel
    ```
5. Access the frontend through at [localhost/frontend/](http://localhost/frontend/) to make a request to the model-service. You can also access the model-service through [localhost/model/apidocs/](http://localhost/model/apidocs/).

### Kubernetes dashboard
To access the dashboard, run
```bash
minikube dashboard
```

## How to run Vagrant
1. Install vagrant and virtualbox
    ```bash
    brew install vagrant
    brew install virtualbox
    ```
2. Run the following command to start the VMs
    ```bash
    vagrant up
    ```
3. Run the following command to provision the VMs
    ```bash
    ./run.sh
    ```
4. You can now access the kubernetes cluster running on the VMs on your host machine's kubectl.

## Assignment 1
Everything that was needed is implemented. See the [model-training repository](https://github.com/Release-Engineering-Group-13/model-training).

Link to elaboration on code quality: [codequality.md](Assignment%201/codequality.md) 

## Assignment 2
With the way we fetch the model (by downloading it when starting the model-service container), we didn't have a need for a volume mount in the docker-compose.

## Assignment 3
The VMs start up, albeit with less than the required amount of CPUs and memory, because our computers could not handle that. Additionally, the the Ansible playbooks are ran through a seperate bash command (./run.sh), as Ansible didn't like something about private keys being too public. This file also makes it so that kubectl for the cluster can be used from the host machine.

The kubernetes cluster is initialized on the VMs, but each node's kube-proxy pod keeps crashing, making the cluster not work. Instead, kubernetes can be run through minikube.

## Assignment 4
The tests are added
We finished the app from assignment 2

- A basic Vagrantfile was set up in the operation repo that initializes the 3 VMs
- An initial kubernetes.yml is made that does the same as the docker-compose, but it just runs on the host machine.

## Assignment 5
Added Istio 
Added environment veriables to the app frontend and backend
Kubernetes progress update
