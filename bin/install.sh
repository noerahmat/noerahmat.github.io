# sh -c "$(curl -fsSL https://bitbucket.org/newrahmat/newrahmat.bitbucket.org/raw/master/bin/install.sh)"
echo "install HELLO"
sh -c "$(sudo curl -fsSL https://bitbucket.org/newrahmat/newrahmat.bitbucket.org/raw/master/bin/hello -o /usr/local/bin/hello && sudo chmod +x /usr/local/bin/hello )"

# sh -c "$(curl -fsSL https://bitbucket.org/newrahmat/newrahmat.bitbucket.org/raw/master/bin/build )"
# sh -c "$(curl -fsSL https://bitbucket.org/newrahmat/newrahmat.bitbucket.org/raw/master/bin/release )"
