FROM elasticsearch:8.19.2
USER root
RUN apt-get update
USER elasticsearch
ENV xpack.security.enabled=false
ENV discovery.type=single-node
ENV cluster.name=local
ENV bootstrap.memory_lock=true
ENV http.cors.enabled=false
ENV http.port=9200
ENV xpack.security.enabled=false
ENV xpack.graph.enabled=false
ENV xpack.watcher.enabled=false
ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
RUN cd /usr/share/elasticsearch \
    && bin/elasticsearch-plugin install -b -s ingest-attachment \
    && bin/elasticsearch-plugin install -b -s analysis-phonetic \
    && bin/elasticsearch-plugin install -b -s analysis-icu
