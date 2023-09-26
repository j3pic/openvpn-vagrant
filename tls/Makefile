all: server.crt server.key dh.pem
	@echo Next, use 'make client.ovpn' to make a client OpenVPN config.

rootCA.key:
	openssl genrsa -out rootCA.key 4096

rootCA.crt: rootCA.key
	openssl req -x509 -new -nodes -key rootCA.key -sha256 -out rootCA.crt -days 358000 -subj "/C=US/ST=CA/O=MyOrg/CN=rootCA"

%.key:
	openssl genrsa -out $@ 4096 1>&2

./%.conf: template.conf.in
	sed "s/NAME/$*/g" < template.conf.in > $@

%.csr: %.key %.conf
	openssl req -new -sha256 -addext "subjectAltName = DNS:$*" -key $*.key -subj "/C=US/ST=CA/O=MyOrg, Inc./CN=$*.stockwell.ai" -out $*.csr 1>&2

%.crt: %.csr rootCA.key rootCA.crt
	bash -c 'openssl x509 -req -extfile <(printf "subjectAltName=DNS:openvpn.stockwell.ai") -in '$*.csr' -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -days 358000 -out '$@ 1>&2

dh.pem:
	openssl dhparam 4096 > dh.pem

clean:
	rm -f *.crt *.key *.srl *.conf *.ovpn *.pem *.csr

%.ovpn: %.crt rootCA.crt
	./make-client-ovpn $@ $*.crt $*.key
