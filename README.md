# vi_setting

```console
foo@bar:~$ apt-get install vim-gui-common
foo@bar:~$ apt-get install vim-runtime
foo@bar:~$ git clone https://github.com/kyuhyoung/vi_setting.git
foo@bar:~$ cd vi_setting
foo@bar:~/vi_setting$ cp -r .vi* ~/
foo@bar:~/vi_setting$ vim
# In vim
:source ~/.vimrc
:PluginInstall
# Press <F5>
```
