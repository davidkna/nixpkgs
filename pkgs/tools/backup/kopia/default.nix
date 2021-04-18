{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kopia";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "v${version}";
    sha256 = "1fa8pacyydzgqnl4ghcj1fvnxg3v7ab24wy8wyd779rj1xxqmdrf";
  };

  vendorSha256 = "04lqnk1y8464r7d7w2qx7lbg3azyyzr21z583arjrnp6ichbjlnl";

  doCheck = false;

  subPackages = [ "." ];

  buildFlagsArray = ''
    -ldflags=
       -X github.com/kopia/kopia/repo.BuildVersion=${version}
       -X github.com/kopia/kopia/repo.BuildInfo=${src.rev}
  '';

  meta = with lib; {
    homepage = "https://kopia.io";
    description = "Cross-platform backup tool with fast, incremental backups, client-side end-to-end encryption, compression and data deduplication";
    license = licenses.asl20;
    maintainers = [ maintainers.bbigras ];
  };
}
