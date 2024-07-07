{ ... }:
{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<cr>";
      }
    ];
  };
}
