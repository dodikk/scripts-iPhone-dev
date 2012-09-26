git clean -df
git checkout HEAD -- `$(git ls-files -m)`
