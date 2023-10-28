#!/usr/bin/env bash

# commit previous changes and force prompt
git commit -a

# BUMP BUILD NUMBER
orig=$(grep "^version: " pubspec.yaml)
changed=$orig
echo $orig
re="(.*)\.(.*)\.(.*)"
while [[ $changed =~ $re ]]; do
  inc="$((${BASH_REMATCH[3]}+1))"
  changed="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}"
done
changed="$changed.$inc"

sed -i '' "s/$orig/$changed/g" pubspec.yaml

git add pubspec.yaml
git commit -m "Bumped build number to $inc"
git push
arrChanged=(${changed/// })
newVersion=${arrChanged[1]}
echo "Adding tag: v$newVersion"
git tag -a "v$newVersion" -m "v$newVersion"
git push origin "v$newVersion"
