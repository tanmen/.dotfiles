#!/bin/sh
# fishをインストール
ROOT=$(cd $(dirname $0);pwd)
brew install fish

# fishをdefaultに設定
if [ ! `cat /etc/shells | grep '/usr/local/bin/fish'` ] ; then
  sudo -- sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
else
  echo 'skip setup shells fish'
fi
chsh -s /usr/local/bin/fish

FISH_RESULT=`$ROOT/init.fish`
echo $FISH_RESULT
