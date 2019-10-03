#!/bin/sh
cat docker-compose.yml | docker run -i funkwerk/compose_plantuml --boundaries --link-graph | docker run -i think/plantuml -tpng > docker-compose.png
