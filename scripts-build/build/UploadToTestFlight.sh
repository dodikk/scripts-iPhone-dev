#/bin/bash

IPA_FILE_NAME=$1
file "$IPA_FILE_NAME"

SUBJECT="[Hudson] : Project ReutersInsider2.0 build #$BUILD_NUMBER, at SVN revision $SVN_REVISION"

curl http://testflightapp.com/api/builds.json -F file=@"$IPA_FILE_NAME" -F api_token='34d11038c3fdce4d20ee784f19f6c842_MTE0NDk5MjAxMS0wNy0yMSAwNDo0OToyMS4yODk2ODM' -F team_token='4931e6b422422670a0c4b4bfb449eda0_MjU5ODkyMDExLTEyLTE2IDExOjE5OjQ4Ljc0MzM5NQ' -F notes="$SUBJECT" -F notify=True -F distribution_lists='QA' --verbose