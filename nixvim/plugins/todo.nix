{ ... }:
{
  programs.nixvim = {
    plugins.todo-comments = {
      enable = true;
    };
  };
}
