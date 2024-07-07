{ ... }:
{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent = {
          smart_indent_cap = true;
          char = " ";
          tab_char = " ";
        };
        scope = {
          enabled = true;
          char = "│";
        };
      };
    };
  };
}
