function gvm
  set count (count $argv)

  # Check for bass
  if not functions -q bass
    echo "You need to install the edc/bass plugin"
    return 1
  end

  # Use GVM_DIR
  if set -q GVM_DIR
    set GVM_SCRIPT "$GVM_DIR/scripts/gvm"
  else
    set GVM_SCRIPT "$HOME/.gvm/scripts/gvm"
  end

  # Check GVM is installed
  if not test -e $GVM_SCRIPT
    echo "You need to install gvm"
    echo "$GVM_SCRIPT"
    return 1
  end

  bass source $GVM_SCRIPT\; gvm $argv
end

function __fish_gvm_get_list_all -d "Get list of GVM versions"
  gvm listall | string replace -r 'gvm.*' '' | string trim
end

function __fish_gvm_get_list -d "Get local list of GVM versions"
  gvm list | string replace -r 'gvm.*' '' | string trim
end
