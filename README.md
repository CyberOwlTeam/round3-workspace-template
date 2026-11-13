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

### Sharing the workspace with us (Live Share)

As well as sharing your screen, you'll share this workspace with the two interviewers using Live Share, so we can follow your code and terminal as we pair. It's already installed in this Codespace.

1. Click the **Live Share** icon in the left-hand Activity Bar (if you don't see it, open Extensions, search "Live Share", and click Install or right-click → Enable).
2. Click **Share**. Sign in with your GitHub account if asked.
3. When the notification says the invitation link is copied, click **Make read-only**. You stay at the keyboard; we only watch and talk.
4. Paste the link into the call chat.
5. When we finish, click the stop icon in the Live Share panel.

Keep this browser tab (or VS Code window) open while sharing: closing the Codespace ends the session for everyone. Only share the link with the interviewers.

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
