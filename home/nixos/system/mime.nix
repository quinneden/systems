# Mime allows us to configure the default applications for each file type
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/markdown" = "vscodium.desktop";
      "text/plain" = "vscodium.desktop";
      "text/x-shellscript" = "vscodium.desktop";
      "text/x-python" = "vscodium.desktop";
      "text/x-go" = "vscodium.desktop";
      "text/css" = "vscodium.desktop";
      "text/javascript" = "vscodium.desktop";
      "text/x-c" = "vscodium.desktop";
      "text/x-c++" = "vscodium.desktop";
      "text/x-java" = "vscodium.desktop";
      "text/x-rust" = "vscodium.desktop";
      "text/x-yaml" = "vscodium.desktop";
      "text/x-toml" = "vscodium.desktop";
      "text/x-dockerfile" = "vscodium.desktop";
      "text/x-xml" = "vscodium.desktop";
      "text/x-php" = "vscodium.desktop";
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/jpg" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/gif" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "text/html" = "zen.desktop";
      "application/pdf" = "zathura.desktop";

      "x-scheme-handler/chrome" = "zen.desktop";
      "application/x-extension-htm" = "zen.desktop";
      "application/x-extension-html" = "zen.desktop";
      "application/x-extension-shtml" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "application/x-extension-xhtml" = "zen.desktop";
      "application/x-extension-xht" = "zen.desktop";
    };
  };
}
