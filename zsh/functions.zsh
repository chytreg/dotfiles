function ip {
  echo "Airport:  $(ifconfig en1 | grep netmask | awk '{print $2}')"
  echo "Ethernet: $(ifconfig en0 | grep netmask | awk '{print $2}')"
}

function git-remove-merged {
  (git branch --merged | grep -v "\*" | xargs -n 1 git branch -d) || echo 'Nothing to do'
}

function send-new-rpm-email {
  :${1?"Usage: GMAIL_PASS=XXX send-new-rpm-email VERSION"}
  curl -fsSL http://bit.ly/19PVqhn | ruby /dev/stdin ${1}
}

function fm {
  if [ -f Procfile.dev ];
  then
    foreman start -f Procfile.dev
  else
    foreman start
  fi
}

function remove-backups() {
  ls -d ~/* | grep '.*bak' | xargs -I {} rm -rf {}
}

function fix-hipchat() {
  curl -fsSL http://bitly.com/10wDsM7 | bash
}

