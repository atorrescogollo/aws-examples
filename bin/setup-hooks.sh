#!/bin/bash

REPODIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )
cd "$REPODIR"

mkdir -p .git/hooks
cat > .git/hooks/pre-commit <<'EOF'
#!/bin/bash -e
for f in $(git diff --cached --name-only | grep -e '\.hcl$' )
do
    echo "== hclfmt: $f =="
    terragrunt hclfmt --terragrunt-check --terragrunt-hclfmt-file "$f"
done
for f in $(git diff --cached --name-only | grep -e '\.tf$' )
do
    echo "== tf-fmt: $f =="
    terraform fmt --check "$f" || {
        echo 2>&1 "ERR: Terraform format error in $f"
        exit 1
    }
done
EOF
chmod +x .git/hooks/pre-commit
