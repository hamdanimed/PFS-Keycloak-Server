# FROM quay.io/keycloak/keycloak:latest as builder

# # Enable health and metrics support
# ENV KC_HEALTH_ENABLED=true
# ENV KC_METRICS_ENABLED=true

# # Configure a database vendor
# ENV KC_DB=postgres

# WORKDIR /opt/keycloak
# # for demonstration purposes only, please make sure to use proper certificates in production instead
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
# RUN /opt/keycloak/bin/kc.sh build

# FROM quay.io/keycloak/keycloak:latest
# COPY --from=builder /opt/keycloak/ /opt/keycloak/

# # change these values to point to a running postgres instance
# ENV KC_DB=postgres
# ENV KC_DB_URL=jdbc:postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb
# ENV KC_DB_USERNAME=hamzal3azz
# ENV KC_DB_PASSWORD=gsWAZYX86hIf

# ENV KC_KEYCLOAK_ADMIN=admin
# ENV KC_KEYCLOAK_ADMIN_PASSWORD=admin
# ENV KC_HTTP_PORT=8080
 
# ENV KC_HOSTNAME=localhost
# ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start"]

# # postgres://hamzal3azz:gsWAZYX86hIf@

# FROM quay.io/keycloak/keycloak:latest as builder


# ENV KC_HEALTH_ENABLED=true 
# ENV KC_METRICS_ENABLED=true


# ENV KC_DB=postgres

# WORKDIR /opt/keycloak

# # COPY keycloak-server.crt.pem /opt/keycloak/keycloak-server.crt.pem 
# # COPY keycloak-server.key.pem /opt/keycloak/keycloak-server.key.pem

# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
# RUN /opt/keycloak/bin/kc.sh build

# FROM quay.io/keycloak/keycloak:latest 
# # COPY --from=builder /opt/keycloak/ /opt/keycloak/
# # WORKDIR /opt/keycloak

# # ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/keycloak-server.crt.pem 
# # ENV KC_HTTPS_CERTIFICATE_KEY_FILE=/opt/keycloak/keycloak-server.key.pem

# ENV KC_DB=postgres
# ENV KC_DB_URL=jdbc:postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb
# ENV KC_DB_USERNAME=hamzal3azz
# ENV KC_DB_PASSWORD=gsWAZYX86hIf 
# ENV KC_HOSTNAME=localhost 
# # ENV KC_KEYCLOAK_ADMIN=admin
# # ENV KC_KEYCLOAK_ADMIN_PASSWORD=admin
# # ENV KC_HTTP_PORT=8080

# ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start-dev"]

# FROM quay.io/keycloak/keycloak:latest 
# COPY --from=builder /opt/keycloak/ /opt/keycloak/
# WORKDIR /opt/keycloak

# ENV KC_HTTPS_CERTIFICATE_FILE=/opt/keycloak/keycloak-server.crt.pem 
# ENV KC_HTTPS_CERTIFICATE_KEY_FILE=/opt/keycloak/keycloak-server.key.pem

# ENV KC_DB=postgres
# ENV KC_DB_URL=jdbc:postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb
# ENV KC_DB_USERNAME=hamzal3azz
# ENV KC_DB_PASSWORD=gsWAZYX86hIf 
# ENV KC_HOSTNAME=localhost 
# ENV KC_KEYCLOAK_ADMIN=admin
# ENV KC_KEYCLOAK_ADMIN_PASSWORD=admin
# ENV KC_HTTP_PORT=8080

# RUN /opt/keycloak/bin/kc.sh --db postgres --db-url jdbc:postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb --db-username hamzal3azz --db-password gsWAZYX86hIf start-dev

# ENTRYPOINT ["/opt/keycloak/bin/kc.sh","start-dev"]

FROM quay.io/keycloak/keycloak:latest

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=password
ENV KC_DB=postgres
ENV KC_DB_USERNAME=hamzal3azz
ENV KC_DB_PASSWORD=gsWAZYX86hIf
ENV KC_DB_URL=postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb

# CMD ["start-dev", "--db", "postgres", "--db-url", "jdbc:postgres:ep-plain-term-789572.eu-central-1.aws.neon.tech/neondb", "--db-username", "hamzal3azz", "--db-password", "gsWAZYX86hIf"]
CMD ["start-dev"]