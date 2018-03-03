function ip {
  echo "Airport:  $(ifconfig en1 | grep netmask | awk '{print $2}')"
  echo "Ethernet: $(ifconfig en0 | grep netmask | awk '{print $2}')"
}

function git-remove-merged {
  (git branch --merged | grep -v "\*" | xargs -n 1 git branch -d) || echo 'Nothing to do'
}

function fm {
  if [ -f Procfile.dev ];
  then
    foreman start -f Procfile.dev
  else
    foreman start
  fi
}

function services() {
  if [ -z $agent ]; then
    echo "Service: $1 not found"
  else
    case "$2" in
    "start")
      launchctl load -w $service_path/$agent
      ;;
    "stop")
      launchctl unload $service_path/$agent
      ;;
    "reload")
      launchctl unload $service_path/$agent
      launchctl load -w $service_path/$agent
      ;;
    *)
      echo "Usage: $0 $1 start|stop|reload"
      ;;
    esac
  fi
}

# agents name start|stop|reload|install
function agents(){
: ${1?"Usage: agents name start|stop|reload|install"}
  service_path=~/Library/LaunchAgents
  if [ $2 = 'install' ]; then
    if (brew --prefix $1 > /dev/null); then
      ln -sfv $(brew --prefix $1)/*.plist $service_path
      chmod 644 $(brew --prefix $1)/*.plist
      agent=$(ls -L $service_path | grep $1 | head -n 1)
      services $1 'start'
    fi
  else
    agent=$(ls -L $service_path | grep $1 | head -n 1)
    services $1 $2
  fi
}

function remove-backups() {
  ls -d ~/* | grep '.*bak' | xargs -I {} rm -rf {}
}

function fix-hipchat() {
  curl -fsSL http://bitly.com/10wDsM7 | bash
}

### docker ###
# remove stopped containers
function drm() { docker rm -f $(docker ps -q -f status=exited) }
# remove dangling (unused) images
function dri() { docker rmi -f $(docker images -q -f dangling=true) }
# enter into a running container
function dent() { docker exec -i -t $1 /bin/bash }
# run bash for any image
function dbash() { docker run --rm -it -e TERM=xterm --entrypoint /bin/bash $1 }
# kill all working images
function dkill() { docker kill $(docker ps -q) }
# garbage collection
function dgc() {
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
}
