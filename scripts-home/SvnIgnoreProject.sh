#!/bin/bash
#
#
######

PROJECT_NAME=$1

svn propset svn:ignore -F ~/svnignore.txt ./$1
svn propset svn:ignore -F ~/xcodeproj_ignore.txt ./$1/$1.xcodeproj

