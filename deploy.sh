echo Deploying...

openssl \
	aes-256-cbc \
	-K $encrypted_96b78b9d55e6_key \
	-iv $encrypted_96b78b9d55e6_iv \
	-in travis_id_rsa.enc \
	-out travis_id_rsa \
	-d

chmod 600 travis_id_rsa

sftp \
	-i travis_id_rsa \
	-o StrictHostKeyChecking=no \
	travis@jancy.org \
	<< ===

	cd incoming
	put artifact.txt
	bye
===
