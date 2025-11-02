{ inputs, pkgs, ... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.brave = {
    enable = true;
    extensions = [
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
      { id = "hedijgjklbddpidomdhhngflipnibhca"; } # Leetcode Difficulty Rating
      { id = "ngfkbnbpdgfeaaipaanopmhfbbkfcnhn"; } # CSES Helper
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "kjacjjdnoddnpbbcjilcajfhhbdhkpgk"; } # Forest
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # JSON Formatter
      { id = "fjcldmjmjhkklehbacihaiopjklihlgg"; } # News Feed Eradicator
      { id = "hdhinadidafjejdhmfkjgnolgimiaplp"; } # Read Aloud
      { id = "oghiinfmhnkmfecckbpcoieaieobblog"; } # Satori Enhancements
      { id = "khncfooichmfjbepaaaebmommgaepoid"; } # Remove YouTube Recommended
    ];
  };

  programs.zen-browser.enable = true;

  xdg.mimeApps =
    let
      value =
        let
          system = pkgs.stdenv.hostPlatform.system;
          zen-browser = inputs.zen-browser.packages.${system}.beta;
        in
        zen-browser.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map (name: { inherit name value; }) [
          "application/x-extension-shtml"
          "application/x-extension-xhtml"
          "application/x-extension-html"
          "application/x-extension-xht"
          "application/x-extension-htm"
          "x-scheme-handler/unknown"
          "x-scheme-handler/mailto"
          "x-scheme-handler/chrome"
          "x-scheme-handler/about"
          "x-scheme-handler/https"
          "x-scheme-handler/http"
          "application/xhtml+xml"
          "application/json"
          "text/html"
        ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };
}
