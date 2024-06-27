# Operation
This is the operation repository of group 13. Here you will find relevant links and material for executing and understanding our work. First, there are instructions on different ways of running the project. At the bottom, there are notes about each assignment.

## Repositories
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
2. Start minikube and enable the ingress addon
    ```bash
    minikube start --driver=docker
    minikube addons enable ingress
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


## How to provision VMs:
0. Make sure you have an ssh key (use the default values)
    ```bash:
    ssh-keygen
    ```
    Install vagrant and virtualbox:
    ```bash
    brew install vagrant
    brew install virtualbox
    ```
1. Start vagrant:
    ```bash
    vagrant up
    ```
2. Provision with ansible playbooks, and copy kubeconfig to host machine:
    ```bash
    ./run.sh
    ```

## How to run Istio
For detailed information, see the notes on Assignment 5.
1. Install kubernetes/minikube as described in "How to run kubernetes":
    ```bash
    brew install kubectl
    brew install minikube
    minikube start --driver=docker
    minikube addons enable ingress
    ```

2. [Download Istio](https://istio.io/latest/docs/setup/getting-started/#download)

3. Install Istio into the current cluster:
    ```bash
    istioctl install
    ```

4. Install Istio's Prometheus, Jaeger, and Grafana addons (change the istio version if you have installed a different one):
    ```bash
    kubectl apply -f istio-1.22.1/samples/addons/prometheus.yaml
    kubectl apply -f istio-1.22.1/samples/addons/jaeger.yaml
    kubectl apply -f istio-1.22.1/samples/addons/grafana.yaml
    ```

5. Setup Kubernetes, Istio and the rate limiter:
    ```bash
        kubectl apply -f Provisioning
    ```  

On some systems the traffic routing results in a 'no healthy upstream' error. In that case, follow the steps below to access the application. Do keep in mind that you will always be referred to the main version of the application since traffic routing is disabled, but everything else remains the same, including use of other commands mentioned in this section of the README.  
```bash
    kubectl delete -f Provisioning
    kubectl label ns default istio-injection=disabled --overwrite 
    kubectl apply -f Provisioning
    kubectl delete -f Provisioning/istio-gateway.yml
    kubectl apply -f istio-minimal.yml
```  

The rate limiter can be tested with the below command. The last http response code should be 429 (too many requests) while the preceding codes should be 200:
```bash
    for i in {1..46}; do curl -o /dev/null -s -w "%{http_code}\n" http://localhost; done
```  

Accessing the application and viewing metrics can be done by executing:
```bash
    minikube tunnel
    istioctl dashboard prometheus
    istioctl dashboard grafana
```  

Once a tunnel has been opened and the grafana entry portal has been started with the above command, the grafana dashboard Grafana.json in folder Monitoring can be viewed by navigating to the '+' at the top right of the Grafana page. There, click on the '+', then select 'Import dashboard'. This will open a page where you can import Grafana.json from the Monitoring folder. Afterwards, it'll be ready for use.


## Assignment 1
Everything that was needed is implemented. See the [model-training repository](https://github.com/Release-Engineering-Group-13/model-training).

Link to elaboration on code quality: [codequality.md](Assignment%201/codequality.md) 

## Assignment 2
With the way we fetch the model (by downloading it when starting the model-service container), we didn't have a need for a volume mount in the docker-compose.

## Assignment 3
The VMs start up, albeit with less than the required amount of CPUs and memory, because our computers could not handle that. Additionally, the the Ansible playbooks are ran through a seperate bash command (./run.sh), as Ansible didn't like something about private keys being too public. This file also makes it so that kubectl for the cluster can be used from the host machine.

The kubernetes cluster is initialized on the VMs, but each node's kube-proxy pod keeps crashing, making the cluster not work. Instead, kubernetes can be run through minikube.

## Assignment 4
For the tests, see the [model-training repository](https://github.com/Release-Engineering-Group-13/model-training).

## Assignment 5
We created an Istio service mesh that has a 90/10 routing of the components, although currently only the app frontend has a experimental version. Metrics can be viewed by visiting the prometheus dashboard while the cluster is active. We also implemented a rate limiter that caps the number of requests per minute to 45. 
