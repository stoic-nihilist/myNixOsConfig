# 1. Generate keypair
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519

# 2. Set folder + file permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# 3. Copy public key -> paste into GitHub Settings > SSH and GPG keys
cat ~/.ssh/id_ed25519.pub

# 4. Point SSH config at the private key
cat >> ~/.ssh/config << 'EOF'
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_ed25519
EOF
chmod 600 ~/.ssh/config

# 5. Set git remote to SSH
git remote set-url origin git@github.com:username/repo.git

# 6. Verify
ssh -T git@github.com
