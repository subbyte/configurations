#### vi mode and prompt ####

fish_vi_mode

function fish_prompt
  echo -n ""
end

function fish_mode_prompt
  if set -q __fish_vi_mode
    echo " "
    if [ (id -u) = "0" ]
      set userprompt "#"
    else
      set userprompt "%"
    end
    switch $fish_bind_mode
      case default
        set_color magenta
        echo $userprompt
      case insert
        set_color green
        echo $userprompt
      case replace-one
        set_color green
        echo $userprompt
      case visual
        set_color magenta
        echo $userprompt
    end
    set_color normal
    echo " "
  end
end


#### right prompt ####

function pwd_for_prompt
  if test "$PWD" != "$HOME"
    echo "$PWD "
  else
    echo "~ "
  end
end

function fish_right_prompt
  # set_color black
  echo (pwd_for_prompt)
  set_color yellow
  echo (hostname)" "
  set_color normal
end


#### greeting phrase ####

function greeting_phrase
  if [ (id -u) != "0" ]
    set -l phrases "Wake up, Neo. The Matrix has you." "Follow the white rabbit." "Knock knock, Neo."
    echo " >"
    echo $phrases[(shuf -i 1-3 -n 1)]
  end
end

set -g -x fish_greeting (greeting_phrase)


#### environment variables ####

set -g -x EDITOR vim
set -g -x SVN_EDITOR vim
set -g -x PYTHONSTARTUP ~/.pythonrc


#### alias ####

function proxysite
  ssh -f -N -D 7070 user@site.com
end
