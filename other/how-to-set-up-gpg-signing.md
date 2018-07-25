# How to sign git commits with GPG

**NB!** Make sure that the dependency `gpg` is installed

1. Generate a key: `gpg --full-generate-key`
   * Select **RSA** and key size of **4096**
   * Let the key never expire (press **enter**)
   * Enter **name** and **email**
   * Enter a **passphrase**
2. Find the key ID: `gpg --list-secret-keys --keyid-format LONG`
   * It output should look something like this: *sec   4096R/XXXXXXXX"*
   * The ID is the X's
3. Run `gpg --armor --export XXXXXXXX`
   * Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`.
4. Open https://github.com/settings/keys and paste the public key
   there
5. Make sure git uses GPG by default
   * `git config --global user.signingkey XXXXXXXX`
   * `git config --global commit.gpgsign true`
