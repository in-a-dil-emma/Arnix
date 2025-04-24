let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) runCommandNoCC gnumake fakeroot gzip typescript sassc;
in {
  installer = runCommandNoCC "make-installer" {
    nativeBuildInputs = [ gnumake fakeroot gzip ];
    src = ./.;
  } ''
    cp -r $src $PWD/source
    chmod -R 777 $PWD/source
    cd $PWD/source
    make installer
    chmod -R 755 build
    mv build $out
  '';
  bootstrap = runCommandNoCC "make-bootstrap" {
    nativeBuildInputs = [ gnumake fakeroot gzip ];
    src = ./.;
  } ''
    cp -r $src $PWD/source
    chmod -R 777 $PWD/source
    cd $PWD/source
    make bootstrap
    chmod -R 755 build
    mv build $out
  '';
  website  = runCommandNoCC "make-website" {
    nativeBuildInputs = [ gnumake typescript sassc ];
    src = ./website;
  } ''
    cp -r $src $PWD/source
    chmod -R 777 $PWD/source
    cd $PWD/source
    make
    rm -f *.ts *.scss
    cd ..
    chmod -R 755 source
    mv source $out
  '';
}
