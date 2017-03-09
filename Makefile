top:; @date

gist := https://gist.githubusercontent.com
user := thydel

~  := ansible.mk
$~ := c5ba9cb9e4d3fb18d8452ca5ad9217df
+  := $~

~  := init-play-dir.yml
$~ := f3cbc54b05ed5d6dbecb7e6f4c86a6cf
+  += $~

url     = $(gist)/$(user)/$($@)/raw
curl    = curl -s $(url) > $@ && chmod +x $@
ansible = ansible localhost -m get_url -a 'url=$(url) dest=./$@ mode=u+x'
choice := curl ansible

$+:; $($(run))
$(choice): $+;

help: ansible.mk; $< help
init: init-play-dir.yml; $< -e use_ssh_config=True

.PHONY: $(choice) help init use

run     := curl
get_url := run := ansible
vartar  := get_url

$(vartar):; @: $(eval $($@))

roles/jsonnet:; cd $(@D); ln -s .. $(@F)
use: roles/jsonnet; jsonnet.yml
