REPO_NAME=$1

git clone https://dodikk@github.com/dodikk/${REPO_NAME}.git ${REPO_NAME}-github

   mv ${REPO_NAME}-github/.git ${REPO_NAME}
   
rm -rf ${REPO_NAME}-github
