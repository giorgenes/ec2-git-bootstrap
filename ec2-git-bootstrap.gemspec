Gem::Specification.new do |s|
  s.name = %q{ec2-git-bootstrap}
  s.version = "0.0.1"
  s.date = %q{2011-07-12}
  s.authors = ["Giorgenes Gelatti"]
  s.email = %q{giorgenes@gmail.com}
  s.summary = %q{}
  s.homepage = %q{http://github.com/giorgenes/ec2-git-bootstrap/}
  s.description = %q{}
  s.executables << "gen-ec2-userdata"
  s.files = Dir["src/*"] + Dir["bin/*"] + ["README"] + Dir["lib/*"]
end
