{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, dbus
, pkg-config
, cmake
}:

stdenv.mkDerivation rec {
  pname = "iio-hyprland";
  version = "f31ee4109379ad7c3a82b1a0aef982769e482faf"; 

  src = fetchFromGitHub {
    owner = "JeanSchoeller";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-P+m2OIVS8QSQmeVYVIgt2A6Q/I3zZX3bK9UNLyQtNOg=";
  };

  nativeBuildInputs = [ meson ninja pkg-config cmake ];
  buildInputs = [ dbus ];

  meta = with lib; {
    description = "iio-hyprland - A Wayland compositor";
    homepage = "https://github.com/JeanSchoeller/iio-hyprland";
    license = licenses.gpl3;
    maintainers = with maintainers; [ mateoworld ];
    platforms = platforms.linux;
  };
}
