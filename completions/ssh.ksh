#: | ssh | ssh known hosts |
read_known_hosts() {
        local _file=$1 _line _host

        while read _line ; do
          _line=${_line%%#*} # delete comments
          _line=${_line%%@*} # ignore markers
          _line=${_line%% *} # keep only host field

          [[ -z $_line ]] && continue

          local IFS=,
          for _host in $_line; do
            _host=${_host#\[}
            _host=${_host%%\]*}
            for i in ${HOST_LIST[*]}; do
              [[ $_host == $i ]] && continue 2
            done
            set -s -A HOST_LIST ${HOST_LIST[*]} $_host
          done
        done <$_file
}

[[ -s /etc/ssh/ssh_known_hosts ]] && read_known_hosts /etc/ssh/ssh_known_hosts
[[ -s ~/.ssh/known_hosts ]] && read_known_hosts ~/.ssh/known_hosts

set -A complete_ssh -- ${HOST_LIST[*]}
set -A complete_scp -- ${HOST_LIST[*]}
set -A complete_mosh -- ${HOST_LIST[*]}
