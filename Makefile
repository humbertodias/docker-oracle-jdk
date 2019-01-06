build-jdk-11:
	docker build \
	--build-arg JAVA_VERSION_MAJOR=11 \
	--build-arg JAVA_VERSION_MINOR=1 \
	--build-arg JAVA_VERSION_BUILD=13 \
	--build-arg JAVA_HASH=90cf5d8f270a4347a95050320eef3fb7 \
	--build-arg JAVA_PACKAGE=jdk \
	--build-arg JAVA_ARCH=x64 \
	-t hldtux/oracle-jdk-11 .

push:
	docker hldtux/oracle-jdk-11