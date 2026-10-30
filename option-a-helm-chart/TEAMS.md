# Who consumes this chart

- **payments**: runs in `dev` and `staging`. Traffic is spiky at month end.
- **onboarding**: runs in `dev` and `staging`. Low traffic, but very strict about readiness: it must not receive traffic before it can serve.

Neither team has written a Helm chart before.
