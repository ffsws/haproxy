# HAProxy - patched for APPUiO

This repository contains patches to the official OpenShift HAProxy app router.
It adds the following features:

* Configuration for Let's Encrypt support
* Listen on IPv6 socket

The upstream HAProxy can be found here: [https://github.com/openshift/origin/tree/master/images/router/haproxy](github.com/openshift/origin).

## Features

### Let's Encrypt support

The acls added are playing nicely together with the Let's Encrypt implementation
from [https://github.com/appuio/letsencrypt](github.com/appuio/letsencrypt).

### IPv6 support

This patch configures HAProxy to also listen on IPv6 sockets. This is useful
if your server has IPv6 available (although not officially supported by OpenShift).

## Usage

The repository contains an OpenShift template which creates a build configuration
and image streams. By default the `Dockerfile` is prepared to be used on OpenShift
Origin, but the `template.yaml` references the supported OpenShift Container
Platform image.

Instantiate the template like this on an OpenShift Container Platform instance:

```
oc process -f https://raw.githubusercontent.com/appuio/haproxy/master/template.yaml | oc create -f -
```

On OpenShift Origin the source image can be overridden:

```
oc process -f https://raw.githubusercontent.com/appuio/haproxy/master/template.yaml FROM_IMAGE="openshift/origin-haproxy-router:v1.3.1" | oc create -f -
```

Update the image tag to the desired version.
