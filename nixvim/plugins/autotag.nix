{ ... }:
{
  programs.nixvim = {
    plugins.ts-autotag = {
      enable = true;
    };
  };
}
