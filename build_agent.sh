#wget "http://hz-win.misty.moe:9877/api/ams/links/agents/redirect?language=multi&system=linux&architecture=64&productType=enterprise&login=S-1-5-21-2305571145-4158612901-3584692523-1005" -OAcronisBackupSetup

VER=$(./AcronisBackupSetup -v 2>/dev/null)
#NAME="nyamisty/acronis_backup_agent"
NAME="ccr.ccs.tencentyun.com/misty/acronis_agent"
echo Going to build agent $VER

export DOCKER_BUILDKIT=1
docker build -f Dockerfile.agent "$@" --progress=plain -t $NAME:$VER .
#docker build -f Dockerfile.agent -t $NAME:$VER .
docker tag $NAME:$VER $NAME
docker push $NAME:$VER
