{ pkgs, buildFHSUserEnv }:

buildFHSUserEnv {
    name = "fhsEasyBuild";
    targetPkgs = pkgs: [];
    multiPkgs = with pkgs; pkgs: [
        which
        procps
        python
        easybuild-framework
        easybuild-easyblocks
        easybuild-easyconfigs
        vsc-base
        bashCompletion
        lmod
        vim
        gnumake
        m4
        perl
        libibverbs
        patch
    ];
    runScript = "bash --norc ";
    profile = ''
        export PYTHONPATH="/usr/lib/python2.7:/usr/lib/python2.7/site-packages:${pkgs.easybuild-easyconfigs}"
        export LUA_PATH="${pkgs.luaposix}/share/lua/5.2/?.lua;;";
        export LUA_CPATH="${pkgs.luaPackages.luafilesystem}/lib/lua/5.2/?.so;${pkgs.luaposix}/lib/?.so;;";
        export LMOD="${pkgs.lmod}"
        . ${pkgs.lmod}/lmod/lmod/init/profile
        export EASYBUILD_MODULES_TOOL=Lmod
        export EASYBUILD_PREFIX=/easybuild
        export EASYBUILD_IGNORE_OSDEPS=True
        export MODULEPATH="$MODULEPATH:/easybuild/modules/all"
    '';
    extraBindMounts = [ "./easybuild=/easybuild" ];
}
