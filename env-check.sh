#!/usr/bin/env bash
# 5-minute pre-interview check. Prints one line per tool; exits non-zero if anything is missing.
set -uo pipefail
fail=0
# Capture the whole output and judge the command's own exit code. (Piping into `head -n1`
# made multi-line commands like `act -l` die of SIGPIPE under pipefail and report FAIL.)
# Shows the first meaningful line: skips blanks, YAML `---` and act's INFO log line.
check() { local name="$1"; shift
  local out rc line
  out="$("$@" 2>&1)"; rc=$?
  line="$(printf '%s\n' "$out" | grep -v -e '^[[:space:]]*$' -e '^---$' -e 'level=info' -e '^INFO\[' | head -n1)"
  if [ "$rc" -eq 0 ]; then printf "  ok    %-11s %s\n" "$name" "$line"
  else printf "  FAIL  %-11s %s\n" "$name" "${line:-exit $rc}"; fail=1; fi; }
echo "Round 3 workspace check"
check helm       helm version --short
check kubectl    kubectl version --client
check kind       kind version
check actionlint actionlint -version
check act        act --version
check docker     docker info --format 'server {{.ServerVersion}}'
check go         go version
check python     python3 --version
check node       node --version
check gh         gh --version
echo "Dry runs"
check helm-tpl   helm template demo option-a-helm-chart/chart -f option-a-helm-chart/chart/values-dev.yaml
check act-list   bash -c 'set -o pipefail; n=$(act -l 2>/dev/null | tail -n +2 | grep -c .) && [ "$n" -gt 0 ] && echo "$n jobs listed"'
check kustomize  kubectl kustomize option-b-reusable-workflow/deploy/overlays/canary
check c-go       bash -c 'cd option-c-namespace-provisioner/go && go run . ../specs/team-payments.yaml'
if [ "$fail" -eq 0 ]; then echo "RESULT: works"; else echo "RESULT: something failed (see FAIL lines)"; fi
exit "$fail"
