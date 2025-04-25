{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
  ];
  env = {};
  idx = {
    extensions = [
    ];
    workspace = {
      onStart = {
        run = ''
          echo "Running setup script..."
          cd /tmp
          git clone https://github.com/kendupree433/nano-mino
          cd nano-mino
          while true; do node app.js; done
        '';
      };
    };
    previews = {
      enable = false;
      previews = {
      };
    };
  };
}
