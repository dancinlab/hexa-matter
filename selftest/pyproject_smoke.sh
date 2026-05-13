#!/usr/bin/env bash
# selftest/pyproject_smoke.sh
#
# Smoke test for hexa-matter/_python_bridge/. Phase E (the Python bridge
# implementation) is queued and not yet committed, so this gate is currently
# expected to SKIP cleanly. It becomes load-bearing once Phase E lands.
#
# Behaviour:
#   - If _python_bridge/ does not exist → SKIP (exit 0) — Phase E not yet
#     implemented. Print informative SKIP line.
#   - If _python_bridge/module/*.py exist → smoke-test by attempting
#     `python3 <module>.py --help` on each. Any non-zero exit (other than
#     argparse "help" which exits 0) is FAIL.

set -u

HERE="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="${HEXA_MATTER_ROOT:-$(cd "$HERE/.." && pwd)}"
BRIDGE="$REPO_ROOT/_python_bridge"

echo "hexa-matter/selftest/pyproject_smoke — _python_bridge/ smoke test"
echo "  bridge dir: $BRIDGE"
echo ""

if [[ ! -d "$BRIDGE" ]]; then
  echo "  [SKIP] _python_bridge/ does not exist — Phase E queued, not yet implemented"
  echo "__HEXA_MATTER_PYPROJECT_SMOKE__ PASS  (SKIP: Phase E pending)"
  exit 0
fi

if [[ ! -d "$BRIDGE/module" ]]; then
  echo "  [SKIP] _python_bridge/module/ does not exist — Phase E queued"
  echo "__HEXA_MATTER_PYPROJECT_SMOKE__ PASS  (SKIP: module/ pending)"
  exit 0
fi

fail=0
checked=0
for f in "$BRIDGE/module"/*.py; do
  [[ -e "$f" ]] || continue
  checked=$((checked + 1))
  name="$(basename "$f")"
  if python3 "$f" --help >/dev/null 2>&1; then
    echo "  [PASS] $name --help exit 0"
  else
    rc=$?
    echo "  [FAIL] $name --help exit $rc"
    fail=$((fail + 1))
  fi
done

if [[ "$checked" -eq 0 ]]; then
  echo "  [SKIP] no _python_bridge/module/*.py files found"
  echo "__HEXA_MATTER_PYPROJECT_SMOKE__ PASS  (SKIP: no modules to test)"
  exit 0
fi

echo ""
if [[ "$fail" -eq 0 ]]; then
  echo "__HEXA_MATTER_PYPROJECT_SMOKE__ PASS  ($checked modules smoke-tested)"
  exit 0
fi
echo "__HEXA_MATTER_PYPROJECT_SMOKE__ FAIL  ($fail of $checked modules failed --help)"
exit 1
