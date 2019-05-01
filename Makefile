# Required login
# https://download.oracle.com/otn/java/jdk/11.0.3+12/37f5e150db5247ab9333b11c1dddcd30/jdk-11.0.3_linux-x64_bin.tar.gz
build-jdk-11:
	docker build \
	--build-arg JAVA_VERSION_MAJOR=11 \
	--build-arg JAVA_VERSION_MINOR=3 \
	--build-arg JAVA_VERSION_BUILD=12 \
	--build-arg JAVA_HASH=37f5e150db5247ab9333b11c1dddcd30 \
	--build-arg JAVA_PACKAGE=jdk \
	--build-arg JAVA_ARCH=x64 \
	-t hldtux/oracle-jdk-11 .

# Public
# https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.tar.gz
build-jdk-12:
	docker build \
	--build-arg JAVA_VERSION_MAJOR=12 \
	--build-arg JAVA_VERSION_MINOR=1 \
	--build-arg JAVA_VERSION_BUILD=12 \
	--build-arg JAVA_HASH=69cfe15208a647278a19ef0990eea691 \
	--build-arg JAVA_PACKAGE=jdk \
	--build-arg JAVA_ARCH=x64 \
	-t hldtux/oracle-jdk-12 .

push:
	docker push hldtux/oracle-jdk-12