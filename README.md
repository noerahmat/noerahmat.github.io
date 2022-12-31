# Helm Chart Qoin

>How to create ?
 
#make directori helm-chart-sources

```
mkdir -p ./
helm-chart-sources
```
#create helm chart

```
helm create helm-chart-sources/helm-chart-test 
```

Lint the chart

`helm lint helm-chart-sources/*`

#Create the Helm chart package

```
helm package helm-chart-sources/*
```
#Create the Helm chart repository index

```
helm repo index --url https://newrahmat.bitbucket.io .
```

!Add new charts to an existing repository
```
helm repo index --url https://newrahmat.bitbucket.io --merge index.yaml .
```


--> And Configure the “helm-chart” repository as pages site


> How to setup ?

#Configure helm client
```
helm repo add loyaltolpi https://newrahmat.bitbucket.io
```
#Update the Helm chart repository
```
helm repo update
```


#Update the Helm chart repository
```
helm show values loyaltolpi/qoin
```


> Requrement 

```
k8s and helm install
```

> How to use ?

#setup secret
```
kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>
```

*docker-server dockerhub is = docker.io

#go / php / python
```
helm install \
qoin-be-client-manager loyaltolpi/qoin \
--set name=qoin-be-client-manager \
--set port=8086 \
--set image.repo=loyaltolpi/qoin-be-client-manager \
--set image.tag=2e6d963 \
--set privateReg.enabled=true \
--set secretName=regcred 
```


#dotnet with arg 
```
helm install \
wal-be-jatis-manager loyaltolpi/qoin \
--set name=wal-be-jatis-manager \
--set project=ewallet \
--set type=front \
--set env=develop \
--set port=4000 \
--set image.repo=loyaltolpi/wal-be-jatis-manager \
--set image.tag=c817189 \
--set arg.enabled=true \
--set privateReg.enabled=true \
--set secretName=regcred
```

#dotnet with env variable manager
```
helm install \
wal-be-bankcode-manager loyaltolpi/qoin \
--set name=wal-be-bankcode-manager \
--set project=ewallet \
--set type=front \
--set env=develop \
--set port=1007 \
--set image.repo=loyaltolpi/wal-be-bankcode-manager \
--set image.tag=19e82e4 \
--set envVar.enabled=true \
--set envName=ASPNETCORE_ENVIRONMENT \
--set privateReg.enabled=true \
--set secretName=regcred 
```

#dotnet with env variable module
```
helm install \
wal-be-bankcode-module loyaltolpi/qoin \
--set timezone.enabled=true \
--set name=wal-be-bankcode-module \
--set project=ewallet \
--set type=back \
--set env=develop \
--set port=80 \
--set image.repo=loyaltolpi/wal-be-bankcode-module \
--set image.tag=ade6587 \
--set envVar.enabled=true \
--set envName=DOTNET_ENVIRONMENT \
--set privateReg.enabled=true \
--set secretName=regcred 
```