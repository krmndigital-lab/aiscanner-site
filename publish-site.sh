#!/bin/bash
# AI Scanner site: creates the PUBLIC GitHub repo krmndigital-lab/aiscanner-site from this folder,
# pushes it and turns on GitHub Pages (main branch, root).
set -euo pipefail
cd "$(dirname "$0")"
git add -A && git commit -q -m "site" || true
gh repo create krmndigital-lab/aiscanner-site --public \
  --description "AI Scanner — privacy policy, terms, licences and support page (no source code)" \
  --source . --remote origin --push
gh api -X POST repos/krmndigital-lab/aiscanner-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null \
  || gh api -X PUT repos/krmndigital-lab/aiscanner-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null
echo "Pages: https://krmndigital-lab.github.io/aiscanner-site/"
