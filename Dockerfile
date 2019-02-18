FROM sonatype/nexus3
ADD install-plugin.sh /opt/plugins/nexus-blobstore-google-cloud/
COPY target/ /opt/plugins/nexus-blobstore-google-cloud/target/
COPY pom.xml /opt/plugins/nexus-blobstore-google-cloud/

USER root

RUN cd /opt/plugins/nexus-blobstore-google-cloud/ && \
    chmod +x install-plugin.sh && \
    ./install-plugin.sh /opt/sonatype/nexus/ && \
    rm -rf /opt/plugins/nexus-blobstore-google-cloud/

RUN chown -R nexus:nexus /opt/sonatype/

USER nexus
