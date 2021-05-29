{
  diff-lcs = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m925b8xc6kbpnif9dldna24q1szg4mk0fvszrki837pfn46afmz";
      type = "gem";
    };
    version = "1.4.4";
  };
  facter = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1aqkfybnmifajfm8a1sk7rigpyf3lssbd8dcjrj60g2gkjmarf7j";
      type = "gem";
    };
    version = "2.5.7";
  };
  facterdb = {
    dependencies = ["facter" "jgrep"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "146732fpcqsgbz4hl574faana2wk1v82n23jx1lkdksv2lhca2hk";
      type = "gem";
    };
    version = "1.6.0";
  };
  fast_gettext = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ci71w9jb979c379c7vzm88nc3k6lf68kbrsgw9nlx5g4hng0s78";
      type = "gem";
    };
    version = "1.1.2";
  };
  hiera = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g1bagbb4lvs334gpqyylvcrs7h6q2kn1h162dnvhzqa4rzxap8a";
      type = "gem";
    };
    version = "3.7.0";
  };
  jgrep = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ns4zsxgwz6f9grrggms8pf4x9ifkv91f74mcm6kn447hrc8a5aj";
      type = "gem";
    };
    version = "1.5.4";
  };
  locale = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0997465kxvpxm92fiwc2b16l49mngk7b68g5k35ify0m3q0yxpdn";
      type = "gem";
    };
    version = "2.1.3";
  };
  mocha = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05yw6rwgjppq116jgqfg4pv4bql3ci4r2fmmg0m2c3sqib1bq41a";
      type = "gem";
    };
    version = "1.12.0";
  };
  multi_json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pb1g1y3dsiahavspyzkdy39j4q377009f6ix0bh1ag4nqw43l0z";
      type = "gem";
    };
    version = "1.15.0";
  };
  pathspec = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "070l1a3aqccr7qkzfcfg0ysw3xv69mkz1ai64c07gspgx3rlj33v";
      type = "gem";
    };
    version = "0.2.1";
  };
  puppet = {
    dependencies = ["facter" "fast_gettext" "hiera" "locale" "multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06sql83qsv8qscidxv63aki2y6j5ypzh0fvxjgpcp0hpdkj79kp1";
      type = "gem";
    };
    version = "5.5.22";
  };
  puppet-lint = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pwpjxxr3wz71yl7jhhaa93fsrr72kz25isjydfhsf1igc9mfj9k";
      type = "gem";
    };
    version = "2.4.2";
  };
  puppet-syntax = {
    dependencies = ["puppet" "rake"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jj10pb25scq3fjnxrcb93zmwqhad53ccxq2y639yj8w38mygv2q";
      type = "gem";
    };
    version = "3.1.0";
  };
  puppetlabs_spec_helper = {
    dependencies = ["mocha" "pathspec" "puppet-lint" "puppet-syntax" "rspec-puppet"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bn6cgmcig93ylx3738in3np0fbcl7azh85dpxv1wvbhbcijws1d";
      type = "gem";
    };
    version = "3.0.0";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1iik52mf9ky4cgs38fp2m8r6skdkq1yz23vh18lk95fhbcxb6a67";
      type = "gem";
    };
    version = "13.0.3";
  };
  rspec = {
    dependencies = ["rspec-core" "rspec-expectations" "rspec-mocks"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dwai7jnwmdmd7ajbi2q0k0lx1dh88knv5wl7c34wjmf94yv8w5q";
      type = "gem";
    };
    version = "3.10.0";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wwnfhxxvrlxlk1a3yxlb82k2f9lm0yn0598x7lk8fksaz4vv6mc";
      type = "gem";
    };
    version = "3.10.1";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sz9bj4ri28adsklnh257pnbq4r5ayziw02qf67wry0kvzazbb17";
      type = "gem";
    };
    version = "3.10.1";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d13g6kipqqc9lmwz5b244pdwc97z15vcbnbq6n9rlf32bipdz4k";
      type = "gem";
    };
    version = "3.10.2";
  };
  rspec-puppet = {
    dependencies = ["rspec"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11dh04msr2sx2mx9g6wyrfa3wcc3b8pch20z85g23pdrqhxdg5zf";
      type = "gem";
    };
    version = "2.8.0";
  };
  rspec-puppet-facts = {
    dependencies = ["facter" "facterdb" "puppet"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "079kbj8kq3chc4miqgf5yhfmpqwcnw402zfr91w60bynavbf87fs";
      type = "gem";
    };
    version = "2.0.1";
  };
  rspec-support = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15j52parvb8cgvl6s0pbxi2ywxrv6x0764g222kz5flz0s4mycbl";
      type = "gem";
    };
    version = "3.10.2";
  };
}
