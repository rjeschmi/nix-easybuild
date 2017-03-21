

{
  packageOverrides = pkgs: rec {
    lmod = pkgs.callPackage ./lmod {
      inherit (pkgs.luaPackages) luafilesystem;
      inherit luaposix;
    };
    luaposix = pkgs.luaPackages.buildLuaPackage rec {
      name = "luaposix-32";

      buildInputs = [ pkgs.perl ];
      src = pkgs.fetchurl {
        url = "https://github.com/luaposix/luaposix/archive/release-v32.tar.gz";
        sha256 = "09dbbde825fd9b76a8a1f6a80920434f8629a392cd1840021ed4b95b21fcf073";
      };
      meta = {
        homepage = "https://github.com/luaposix/luaposix";
      };
    };
    xmlrunner = pkgs.pythonPackages.buildPythonPackage rec {
      name = "xmlrunner-${version}";
      version = "1.7.7";
      doCheck = false;
      src = pkgs.fetchurl {
          url = "https://pypi.python.org/packages/source/x/xmlrunner/xmlrunner-1.7.7.tar.gz";
          md5 = "7b0b152ed2d278516aedbc0cac22dfb3";
      };
      meta = {
          description = "PyUnit-based test runner with JUnit like XML reporting.";
      };

    };

    vsc-base = pkgs.pythonPackages.buildPythonPackage rec {
      name = "vsc-base-${version}";
      version = "2.4.2";
      src = pkgs.fetchurl {
          url = "https://pypi.python.org/packages/source/v/vsc-base/${name}.tar.gz";
          md5 = "e2be08dce78819c42626e52fa7ca4f1c";
      };

      meta = {
          description = "The vsc base";
      };

    };
    easybuild-framework = pkgs.pythonPackages.buildPythonPackage rec {
        name = "easybuild-framework-${version}";
        version = "2.4.0";
        doCheck = false;
        buildInputs = with pkgs.pythonPackages; [ xmlrunner ];
        propagatedBuildInputs = with pkgs.pythonPackages; [ vsc-base pyyaml ];
        src = pkgs.fetchurl {
          url = "https://pypi.python.org/packages/source/e/easybuild-framework/${name}.tar.gz";
          md5 = "3fc76a2e72f5a0392f722ef11a64c56b";
        };

        meta = {
          description = "The EasyBuild framework";
        };
    };
    easybuild-easyblocks = pkgs.pythonPackages.buildPythonPackage rec {
        name = "easybuild-easyblocks-${version}";
        version = "2.4.0";
        doCheck = false;
        propagatedBuildInputs = with pkgs.pythonPackages; [ easybuild-framework ];
        src = pkgs.fetchurl {
          url = "https://pypi.python.org/packages/source/e/easybuild-easyblocks/${name}.tar.gz";
          md5 = "2eaf3b8134257bbfccfc938281136c72";
        };

        meta = {
          description = "The EasyBuild framework";
        };
    };

    easybuild-easyconfigs = pkgs.pythonPackages.buildPythonPackage rec {
        name = "easybuild-easyconfigs-${version}";
        version = "2.4.0";
        doCheck = false;
        propagatedBuildInputs = with pkgs.pythonPackages; [ easybuild-easyblocks ];
        src = pkgs.fetchurl {
          url = "https://pypi.python.org/packages/source/e/easybuild-easyconfigs/${name}.tar.gz";
          md5 = "8554eeb59d4539a9dc70bf0b134fa332";
        };

        meta = {
          description = "The EasyBuild framework";
        };
    };
    fhsEasyBuild = pkgs.callPackage ./shell/fhs-env.nix {  };

  };
}
