{- HELP
Box configuration file
  userName        : Full user name e.g "John Doe" (used in git)
  userEmail       : Email address e.g "jdoe@cirb.brussels" (used in git)
  repos           : Git repos to activate; see https://github.com/CIRB/vcsh_mr_template/tree/master/.config/mr/available.d
  eclipsePlugins  : Download eclipse plugins such as egit or m2e ?
  wallpaper       : Devbox wallpaper, see https://github.com/CIRB/devbox-dotfiles/.wallpaper
  console         : Console configuration such as light or dark background
  additionalRepos : List of additional personal mr repositories you might want to add
                    mr repo is a record with two fields. e.g: { path     = "$HOME/.config/vcsh/repo.d/local.git"
                                                              , checkout = "vcsh clone git@github.com:PierreR/devbox-dotfiles.git local"
                                                              }
  envPackages     : List of packages to be installed in the user env and pinned with a specific nixpkgs pointer
-}

{ userName =
    "Pierre Radermecker"
, userEmail =
    "pradermecker@cirb.brussels"
, loginId =
    ./shell.dhall .loginId
, repos =
    [ "nixpkgs-config.mr"
    , "cicd-ansible.mr"
    , "cicd-management.mr"
    , "cicd-shell.mr"
    , "devbox.mr"
    , "devbox-xmonad.mr"
    , "language-puppet.mr"
    , "pi3r-notebook.mr"
    , "docker-images.mr"
    , "puppet-atlassian.mr"
    , "puppet-ci.mr"
    , "puppet-cicd.mr"
    , "puppet-bas.mr"
    , "puppet-blockchain.mr"
    , "puppet-bos.mr"
    , "puppet-brucat.mr"
    , "puppet-editoria.mr"
    , "puppet-fidus.mr"
    , "puppet-fmx.mr"
    , "puppet-genericservices.mr"
    , "puppet-gis.mr"
    , "puppet-hms.mr"
    , "puppet-iam.mr"
    , "puppet-irisbox.mr"
    , "puppet-klimcicc.mr"
    , "puppet-middleware.mr"
    , "puppet-nova.mr"
    , "puppet-plone.mr"
    , "puppet-shared.mr"
    , "puppet-smartcity.mr"
    , "puppet-template.mr"
    , "puppet-tms.mr"
    , "puppet-tdq.mr"
    , "puppet-urbisaddress.mr"
    , "salt-base.mr"
    , "salt-middleware.mr"
    , "spacemacs.mr"
    ]
, eclipsePlugins =
    False
, wallpaper =
    "abstract-red.jpg"
, console =
    { color = "light" }
, additionalRepos =
    [ { path =
          "\$HOME/.config/vcsh/repo.d/local.git"
      , checkout =
          "vcsh clone git@github.com:PierreR/devbox-dotfiles.git local"
      }
    , { path =
          "\$HOME/projects/pi3r/haskell/template"
      , checkout =
          "git clone git@mygithub.com:PierreR/haskell-template.git template"
      }
    , { path =
          "\$HOME/projects/pi3r/devbox-config"
      , checkout =
          "git clone git@mygithub.com:PierreR/devbox-config.git devbox-config"
      }
    ]
, envPackages =
    [ "cicd-shell", "vcsh" ]
}
