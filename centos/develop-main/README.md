
It is vm for Laradock.
The host OS is centos 7.
Automatically partially initialize laradock.

### Install

<pre>
  git clone https://github.com/gdgd/vagrant_laradock_base.git
  cd {clone dir}
</pre>


Add git setting to Vagrantfile
<pre>
  vi Vagrantfile
</pre>

Please change your Git account.
<pre>
  # settings
  GIT_USER = "hogehoge"
  GIT_EMAIL = "hogehoge"
</pre>

Please change your Laravel-Project.  
<pre>
  MY_GIT_PROJECT_URL = "hogehoge"
  PROJECT_NAME = "hogehoge"
</pre>

Ifthere is notLaravel-Project,we will set a blank.  
<pre>
  MY_GIT_PROJECT_URL = ""
  PROJECT_NAME = ""
</pre>


When setting is completed, start vagrant.
<code>
vagrant up  
</code>

my project install
<code>
  vagrant ssh

  
  cd /workspace/laradock
  docker-compose exec workspace bash


  git clone {my project}

</code>


## その他
以下のディレクトリ構成とsyncする想定です。

- data : dbの保存先や、exportしたファイル等の置き場
- shells : provisionの追加設定、便利ツール置き場
- workspace : プロジェクト作成先。ソース置き場
- dockerspace : dockerプロジェクト、dockerイメージ当の置き場

自分の設定を追加したい場合は `Vagrantfile` に変更を加えてください。

