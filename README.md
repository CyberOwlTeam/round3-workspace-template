# Round 3 pairing workspace

Welcome. This workspace has everything installed, so you don't need anything on your own machine. This repo is your own copy, in your account; it runs on GitHub's free monthly Codespaces allowance, so it costs you nothing.

## Before the interview (5 minutes)

Open a terminal in this workspace and run:

```bash
bash env-check.sh
```

Reply to the recruiter with **"works"**, or paste what failed. We'll fix it before the day.

## On the day

You'll share your screen and build one of three exercises live, pairing with two of us. AI tools are allowed; say what you're using.

| Folder | Option |
|---|---|
| `option-a-helm-chart/` | A. Helm chart for two squads |
| `option-b-reusable-workflow/` | B. Reusable GitHub Actions workflow (its workflow files live in `.github/workflows/`, because GitHub only runs workflows from there) |
| `option-c-namespace-provisioner/` | C. Namespace provisioner |

The briefs were sent to you the day before. Each folder's `README.md` says what's there to start from.

Handy commands:

| Tool | Try |
|---|---|
| Helm | `helm template demo option-a-helm-chart/chart -f option-a-helm-chart/chart/values-dev.yaml` |
| actionlint | `actionlint` (checks every workflow in `.github/workflows/`) |
| act | `act -l` (lists workflows), `act push -W .github/workflows/build.yml` |
| kustomize | `kubectl kustomize option-b-reusable-workflow/deploy/overlays/canary` |
| kind | `kind create cluster --name r3` (option C stretch only; takes ~1 minute) |

## After the interview

Delete the Codespace from https://github.com/codespaces so it stops using your free storage allowance. The repo is yours to keep or delete.
