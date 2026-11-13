// Parser stub: reads a spec into a struct. Everything else is yours.
package main

import (
	"fmt"
	"os"

	"gopkg.in/yaml.v3"
)

type Member struct {
	Group string `yaml:"group"`
}

type Rule struct {
	Resources []string `yaml:"resources"`
	Verbs     []string `yaml:"verbs"`
}

type Quota struct {
	CPU    string `yaml:"cpu"`
	Memory string `yaml:"memory"`
	Pods   int    `yaml:"pods"`
}

type Spec struct {
	Team      string   `yaml:"team"`
	Namespace string   `yaml:"namespace"`
	Members   []Member `yaml:"members"`
	Access    []Rule   `yaml:"access"`
	Quota     Quota    `yaml:"quota"`
}

func LoadSpec(path string) (*Spec, error) {
	raw, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var s Spec
	if err := yaml.Unmarshal(raw, &s); err != nil {
		return nil, fmt.Errorf("parse %s: %w", path, err)
	}
	return &s, nil
}

func main() {
	if len(os.Args) < 2 {
		fmt.Fprintln(os.Stderr, "usage: provisioner <spec.yaml>")
		os.Exit(2)
	}
	s, err := LoadSpec(os.Args[1])
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	fmt.Printf("loaded spec for team %q, namespace %q\n", s.Team, s.Namespace)
}
