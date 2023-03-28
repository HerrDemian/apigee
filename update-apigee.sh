#set env variables
export APIGEECTL_HOME=$PWD
echo $APIGEECTL_HOME

#backup version 1.8.2
tar -czvf $APIGEECTL_HOME/../apigeectl-v1.7-backup.tar.gz $APIGEECTL_HOME

#go to apigeectl dir
cd $APIGEECTL_HOME/..

#download release package
curl -LO \
  https://storage.googleapis.com/apigee-release/hybrid/apigee-hybrid-setup/$1.8.5/apigeectl_linux_64.tar.gz 

mv $APIGEECTL_HOME/ $APIGEECTL_HOME-v1.8.2/  

tar xvzf filename.tar.gz -C ./

#Rename that directory to apigeectl using the following command
mv apigeectl_1.8.5-xxxxxxx_linux_64 apigeectl

#Change to the apigeectl directory:
cd ./apigeectl

#Verify the version of apigeectl with the version command:
./apigeectl version

#move to hybrid files
cd $APIGEECTL_HOME/../hybrid-files

#Update the following symbolic links
ln -nfs $APIGEECTL_HOME/tools tools
ln -nfs $APIGEECTL_HOME/config config
ln -nfs $APIGEECTL_HOME/templates templates
ln -nfs $APIGEECTL_HOME/plugins plugins

#check that the symlinks were created correctly
ls -l | grep ^l

#copy the overides file, and certificates 
cp ...

#Do a dry run initialization to check for errors:
${APIGEECTL_HOME}/apigeectl init -f OVERRIDES_FILE --dry-run=client

#If there are no errors, initialize hybrid 1.8.5
$APIGEECTL_HOME/apigeectl init -f OVERRIDES_FILE

#Check the initialization status:
$APIGEECTL_HOME/apigeectl check-ready -f OVERRIDES_FILE

#On success, the output says: All containers ready.

#run this command to check ApigeeDataStore status:

#run this command to check ApigeeDataStore status:
#In the output, look for State: running.
kubectl describe apigeeds -n apigee

#Check for errors with a dry run of the apply command using the --dry-run flag:
$APIGEECTL_HOME/apigeectl apply -f OVERRIDES_FILE --dry-run=client

$APIGEECTL_HOME/apigeectl apply -f OVERRIDES_FILE

$APIGEECTL_HOME/apigeectl check-ready -f OVERRIDES_FILE
