package main

import (
	"log"

	"github.com/rmukhamet/app_template/internal/config"
  )

func main() {
	// Configuration
	cfg, err := config.NewConfig()
	if err != nil {
		log.Fatalf("config error: %s", err)
	}

	// Run
	err=run()
  if err != nil {
		log.Fatalf("app error: %s", err)
	}
}

func run(){
  // app start
  }
