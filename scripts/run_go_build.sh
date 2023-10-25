export GO_ENABLED=0

go_build_package() {
  GO_SRC_FILES=$(find "$1" -name "*.go" | tr "\n" " ")
  if [[ "$DEBUG" -eq "1" ]]; then
  go build --gcflags="all=-N -1" -v -o "$2" $GO_SRC_FILES
  else 
  go build -v -o "$2" $GO_SRC_FILES
  fi
  }

for APP_NAME in "$@"; do 
go_build_package "cmd/$APP_NAME" "bin/$APP_NAME"
done

