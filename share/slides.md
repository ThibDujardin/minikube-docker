<style>

.reveal pre code {
  max-height: 900px;
  font-size: 15px;
  line-height: normal;
}

#logo {
	width: 50%;
	vertical-align:middle;
	background-color: transparent;
	border:0;
}

#me {
    font-size: 0.7em !important;
}

.reveal table th, .reveal table td {
    padding: 0em 0em 0em 0em;
}

.reveal section td p,ul {
  font-size: 0.7em;
}

.image-txt-container {
  display: flex;
  align-items: center;
}

</style>


## A Docker Desktop alternative

<div>
<img id="logo" alt="logo" src="img/docker-desktop.png" />
</div>

@SfeirLille - 02/2022

Note:

---

<div>
  <h2>About me</h2>
  <pre>
    <code id=me>
  who : "Thibauld Dujardin"
  mission : Dev Back / DevOps 
  certs :
    gcp :
        - name : "architect"
  hobbies : "sports"
    </code>
  </pre>
</div>

Note:
- Thibauld Dujardin
- Dev Backend / Devops chez Decathlon / Feature Masterpice
- Chez sfeir depuis Septembre 2020 
- Aujourd'hui je vous proposer de parler de la migration Docker Desktop vers Minikube

---
## Migration context

<img style="background-color:#FFFFFF" width="100%" height="50%" src="img/docker-desktop-pricing.png"/>

Note:
* Avant de commencer, je vous propose un petit historique
  * Aug 31, 2021 - Annoucement pricing / updated terms effective
  * January 31, 2022 - end of the grace period 
  * Mac os users & windows users
  * RootLess VM

----

## Who is impacted

<section>
    <p class="fragment highlight-green">Small businesses</p>
    <p class="fragment highlight-red">Individual developper</p>
    <p class="fragment highlight-red">Development teams 5+</p>
    <p class="fragment highlight-red">Medium and large businesses 50+</p>
</section>

Note: 
- small businesses
    - fewer than 250 employees AND less than $10 million in revenue
    - personal use
    - education
    - non-commercial open source projects

---

## Aternatives 

----

### Colima 

- Intel and M1 Macs support
- Simple CLI interface
- Docker and Containerd support
- Port Forwarding
- Volume mounts
- Kubernetes

https://github.com/abiosoft/colima

Note:
- based on Lima
  - Lima can be considered as a some sort of unofficial "containerd for Mac".
- Limitations
  - Some command like docker compose still don't work very well ( complicated docker compose )
  - Still in a early stage

----

### Rancher Desktop

<div>
    <img width="10%" src="img/rancherdesktop.svg"/>
</div>

- Container Management
- Windows,linux and Macs support (Intel and M1)
- Kubernetes Made Simple
- Desktop application
- Port Forwarding

https://rancherdesktop.io/

Note: 
- based on Lima
- Limitations
  - Kubernetes can't be stopped 

----

<div>
    <img width="50%" src="img/podman.svg"/>
</div>

- Daemonless
- alias docker=podman
- Docker & pod format
- Root or rootless
- Port Forwarding
- Volume mounts
- Kubernetes
- Maintainer : RedHat

https://podman.io/

Note: 
- Limitations
  - Docker compose still not supported entirely (podman-compose)
  - Difficult customization

----

<div>
    <img width="50%" src="img/minikube.svg"/>
</div>

- DNS
- NodePorts
- ConfigMaps et Secrets
- Dashboards
- Container Runtime: Docker, CRI-O, et containerd
- Activation de la CNI (Container Network Interface)
- Ingress
- part of the kubernetes project
- Volume
- Kubernetes can be turned off

https://github.com/kubernetes/minikube

Note: 
- Limitations
  - Difficult error message
  - some customization may be required

---

### Requirement

- minikube 
- hyperkit 
- docker 
- docker-compose
- zsh (optional)

```shell
brew install minikube hyperkit docker docker-compose
```

Note: 
- Hyperkit
  - HyperKit is a toolkit for embedding hypervisor capabilities in your application. 
  - It includes a complete hypervisor, which is optimized for lightweight virtual machines and container deployment.
  - It is designed to be interfaced with higher-level components such as the VPNKit and DataKit.
  - no `localhost`

----

### Let's run

Activate the minikube completion for zsh : 

```shell
minikube completion zsh 
```

----

```shell
  minikube start \
    --driver=hyperkit \
    --container-runtime=docker \
    --no-kubernetes \
    --vm=true \
    --cpus 2 \
    --memory 8000
```

Note: 

* `-drive=hyperkit` best drive to use withmacos can be change to `VirtualBox` etc. You can even use your local docker (Linux only)
* `--container-runtime=docker` the runtime we use on the minikube's vm. Can be `containerd` or `cri-o` 
* `--cpus 2` at least 2 cpu for a K8S cluster
* `--memory` at least 2 Go required

----

### Pull images from external registry

```shell
minikube ssh -- sudo sed -i "/Network/aDNS=8.8.8.8" /etc/systemd/network/10-eth1.network
minikube ssh -- sudo sed -i "/Network/aDNS=8.8.8.8" /etc/systemd/network/20-dhcp.network
minikube ssh -- sudo systemctl restart systemd-networkd 
```

Manual restart :

```shell
minikube ssh
	sudo systemctl restart systemd-networkd 
	exit
```

Note:
* For some unknown reason some time the `systemd-networkd` wont reastart 

----

### Workaround to use `localhost`




----
### Mounting volume




