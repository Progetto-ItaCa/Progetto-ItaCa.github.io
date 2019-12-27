#!/usr/bin/env bash

# Configuration
SOURCE_FOLDER=_site/
TARGET_BRANCH=master
TARGET_REMOTE=origin

# If you don't have a target yer and want an orphan, you can:
# > git checkout --orphan $TARGET_BRANCH
# > git commit --allow-empty -m 'Initial commit'
# > git push --set-upstream $TARGET_REMOTE $TARGET_BRANCH

# Usage:
#   1. `./publish.sh setup` to setup the repo
#   2. Do whatever to produce a build in $SOURCE_FOLDER
#   3. `./publish.sh run` to publish your stuff
#   4. Go to 2 until satisfied
#   5. `./publish.sh teardown` to clean up the repo

case $1 in
setup)
  echo "Setting up..."
  rm -rf $SOURCE_FOLDER
  git worktree prune
  git worktree add $SOURCE_FOLDER $TARGET_BRANCH
  ;;
run)
  echo "Running..."
  pushd $SOURCE_FOLDER || exit
  git add .
  git commit -m "Deploy @ $(date)"
  popd || exit
  git push $TARGET_REMOTE $TARGET_BRANCH
  ;;
teardown)
  echo "Tearing down..."
  rm -rf $SOURCE_FOLDER
  git worktree prune
  ;;
*)
  echo ""
  ;;
esac
