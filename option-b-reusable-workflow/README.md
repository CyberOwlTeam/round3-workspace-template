# Option B: Reusable GitHub Actions workflow

What's here:

- `service/`: a trivial Python service with one unit test and a `Dockerfile`.
- `deploy/base/`: the Kubernetes manifest for the service (image is the placeholder `IMAGE`).
- `deploy/overlays/canary/`: an overlay that currently changes nothing. It's yours to shape.
- `../.github/workflows/build.yml`: what the squads have today. Rough on purpose; read it first.
- `../.github/workflows/caller.yml`: a caller stub to wire up to your reusable workflow.
- `CALLERS.md`: the two repos that would call your workflow.

Nothing deploys to a cluster. "Deploy" means: render the manifest for the image you pushed, and upload it as a workflow artifact.

- Images push to GitHub Container Registry with the built-in `GITHUB_TOKEN` (the workflow needs `permissions: packages: write`). No other secret is needed.
- You can push tags to this repo, e.g. `git tag b-v0.1.0 && git push origin b-v0.1.0`.
- Check locally before pushing: `actionlint`, then `act -l` / `act push`.
- Render locally: `kubectl kustomize deploy/overlays/canary`.
