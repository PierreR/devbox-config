{- HELP
Box configuration file
  userName        : Full user name e.g "John Doe" (used in git)
  userEmail       : Email address e.g "jdoe@cirb.brussels" (used in git)
  loginId         : LoginId is typically a username used by external services as a identification id.
                    The box just stores this value in an env variable called 'LOGINID' that can then be used by other programs.
  mountDir        : ROOT_DIR folder mount point. Location of a folder mounted within your host to hold external files.
                    Typically the guest location of a windows shared folder or a usb device.
  sshkeysDir      : The ssh-keys folder path. All keys in that directory will be synchronized within your $HOME/.ssh folder
  eclipse         : Do you want to install a statically defined Eclipse version that is known to work
                    (see user/eclipse.sh for more detail)
  wallpaper       : An image file in ~/.wallpaper that will be used as wallpaper.
                    see https://github.com/CIRB/devbox-dotfiles/.wallpaper
  console.color   : A color configuration file in ~/.config/termite that can be used to provide a light or dark theme to the terminal.
  mr.config       : List of additional personal mr repositories you might want to add to your mrconfig file.
  mr.templateUrl  : Url of a mr_template repository to be cloned by vcsh. This repo describes a set of available pre-defined mr repositories.
  mr.repos        : List of repositories to activate from the available set defined above.
  nix-env         : List of specs for the nix-env --install command
-}

let mountDir = "/mnt/shared"
in

{ userName =
    "Pierre Radermecker"
, userEmail =
    "pradermecker@cirb.brussels"
, loginId =
    "pradermecker"
, mountDir = "${mountDir}"
, sshkeysDir = "${mountDir}/ssh-keys"
, eclipse = False
, wallpaper =
    "mountain.jpg"
, console =
    { color = "light" }
, mr =
  { config =
    [ ".config/vcsh/repo.d/local.git checkout='vcsh clone git@github.com:PierreR/devbox-dotfiles.git local'"
    , "projects/pi3r/devbox checkout='git clone git@mygithub.com:PierreR/devbox.git devbox'"
    , "projects/pi3r/eks checkout='git clone git@mygithub.com:PierreR/eks-lab.git eks'"
    , "projects/pi3r/haskell/template checkout='git clone git@mygithub.com:PierreR/haskell-template.git template'"
    , "projects/pi3r/devbox-config checkout='git clone git@mygithub.com:PierreR/devbox-config.git devbox-config'"
    , "projects/pi3r/notebook checkout='git clone git@mygithub.com:PierreR/notebook.git notebook'"
    , "projects/pi3r/site checkout='git clone git@mygithub.com:PierreR/pierrer.github.io.git site'"
    ]
  , templateUrl = "git://github.com/CIRB/vcsh_mr_template.git"
  , repos =
    [ "nixpkgs-config.mr"
    , "cicd-management.mr"
    , "cicd-shell.mr"
    , "devbox.mr"
    , "devbox-xmonad.mr"
    , "devbox-dotfiles.mr"
    , "elk-doc.mr"
    , "elk-lab.mr"
    , "language-puppet.mr"
    , "puppet-ci.mr"
    , "puppet-cicd.mr"
    , "puppet-shared.mr"
    , "spacemacs.mr"
    ]
  }
, nix-env =
    [ "-f https://github.com/CIRB/cicd-shell/archive/v2.5.11.tar.gz"
    , "-A dhall -f https://github.com/PierreR/devbox-config/archive/389fa9f5f8a5042090affbb3aa265d5ad2a3fc91.tar.gz"
    ]
}
