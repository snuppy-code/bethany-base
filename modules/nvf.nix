{
  pkgs,
  inputs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      options = {
        expandtab = true; # put spaces instead of tabs
        tabstop = 8; # tabs appear 8 wide
        shiftwidth = 4; # neovim indentation commands (e.g. >> <<) use 4 spaces
        softtabstop = 4; # remove/place 4 spaces with backslash and tab
      };
      theme.enable = true;
      lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = true;
        trouble.enable = true;
      };
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.blink-cmp.enable = true;
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
        neogit.enable = true;
      };
      tabline = {
        nvimBufferline.enable = true;
      };
      filetree = {
        neo-tree = {
          enable = true;
        };
      };
      visuals = {
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix = {
          enable = true;
          format.type = ["alejandra"];
        };
        markdown.enable = true;
        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
        };
        bash.enable = true;
        clang.enable = false;
        css.enable = false;
        html.enable = false;
        json.enable = true;
        sql.enable = false;
        java.enable = true;
        kotlin.enable = false;
        typescript.enable = false;
        go.enable = true;
        lua.enable = true;
        zig.enable = false;
        python.enable = true;
        typst.enable = true;
        toml.enable = true;
        # xml.enable = true;
        julia.enable = false;
        gleam.enable = false;
        haskell.enable = false;
      };
    };
  };
}
