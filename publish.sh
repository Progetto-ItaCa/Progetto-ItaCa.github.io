#!/usr/bin/env bash

# Configuration
SOURCE_FOLDER=_site/
TARGET_BRANCH=master
TARGET_REMOTE=origin

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
