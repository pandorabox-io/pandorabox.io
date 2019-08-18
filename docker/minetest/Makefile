TAG=registry.rudin.io/x86/minetest:pandorabox

MOUNTS=-v /tmp/.X11-unix:/tmp/.X11-unix
PORTS=-p 30000:30000
ENVIRONMENT=-e DISPLAY=$(DISPLAY)

RUNDEFAULT=docker run -it --rm $(MOUNTS) $(ENVIRONMENT) $(PORTS) $(TAG)



build:
	docker build -t $(TAG) .

push:
	docker push $(TAG)

run:
	$(RUNDEFAULT) /bin/bash
