# Puma on Alpine

Ruby [Puma] Server based on alpine which is the 


Usage:

    docker run --rm \
	--env COMMON_NAME=<Common Name> \
	--env KEY_NAME=<Cert File Names Prefix> \
	--volume /var/certs:/certs centurylink/openssl