# Option C: Namespace provisioner

What's here:

- `specs/team-payments.yaml`: a valid spec.
- `specs/invalid-typo-verb.yaml`: an invalid spec (a typo'd verb and a quota that is too small to be useful).
- A parser stub in each language. It reads a spec file into a typed structure and does nothing else. Pick one:
  - `go/`: `go run . ../specs/team-payments.yaml`
  - `python/`: `python3 provisioner.py ../specs/team-payments.yaml` (tests: `python3 -m pytest -q`)
  - `ts/`: `npx ts-node src/index.ts ../specs/team-payments.yaml`

The minimum is: validate, print the manifests in a dry run, write them to files, with tests. Re-running gives the same files.

A local cluster is available for the stretch only: `kind create cluster --name r3`.
