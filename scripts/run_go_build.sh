go_build_package() {
  GO_SRC_FILES=$(find "$1" -name "*.go" | tr "\n" " ")
  }

for APP_NAME in "$@"; do 
go_build_package "cmd/$APP_NAME" "bin/$APP_NAME"
done
