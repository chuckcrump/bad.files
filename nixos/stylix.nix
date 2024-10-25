{config, inputs, pkgs, ...}:

{
  stylix = {
      enable = true;
      base16Scheme = {
	base00 =  "#1d1f21";
  	base01 =  "#212326";
  	base02 =  "#1d1f21";
  	base03 =  "#969896";
  	base04 =  "#c5c8c6";
  	base05 =  "#c5c8c6";
  	base06 =  "#ffffff";
  	base07 =  "#ffffff";
  	base08 =  "#cc342b";
  	base09 =  "#fba922";
  	base0A =  "#fba922";
  	base0B =  "#198844";
  	base0C =  "#3971ed";
  	base0D =  "#3971ed";
	base0E =  "#a36ac7";
  	base0F =  "#cc342b";
      };
      image = ./IMG_0102.jpeg;
      polarity = "dark";
      autoEnable = true;

      cursor = {
	name = "Banana";
	package = pkgs.banana-cursor;
	size = 24;
      };

      fonts = {
        sansSerif = {
	  name = "Inter";
	  package = pkgs.inter;
	};
	
	#sans = {
	#  name = "Quicksand";
	#  package = pkgs.quicksand;
	#};
      };
    };
}
