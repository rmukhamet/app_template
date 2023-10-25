export GO_ENABLED=0

GIT_COMMIT := $(shell git rev-parse HEAD)
export APP_VERSION=$(RELEASE_VERSION)
export APP_REVISION=$( GIT COMMIT)

go_build_package() {
  GO_SRC_FILES=$(find "$1" -name "*.go" | tr "\n" " ")
  if [[ "$DEBUG" -eq "1" ]]; then
  go build --gcflags="all=-N -1" -v -o "$2" $GO_SRC_FILES
  else 
  go build -v -ldflags \
  '-X version.Version=$APP_VERSION version.Revision=$APP_REVISION' \
  -o "$2" $GO_SRC_FILES
  fi
  }

for APP_NAME in "$@"; do 
go_build_package "cmd/$APP_NAME" "bin/$APP_NAME"
done

