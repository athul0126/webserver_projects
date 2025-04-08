# Hosting Multiple Domains on One IP with Nginx

## Prerequisites
- Nginx installed on your server
- Root or sudo access
- Domains pointed to your server's IP (via DNS or `/etc/hosts` for local testing)

## Step 1: Create Site Directories
```bash
sudo mkdir -p {site_root}/example.local.com
sudo mkdir -p {site_root}/test.local.com
```

## Step 2: Assign Permissions
```bash
sudo chown -R $USER:$USER {site_root}/example.local.com
sudo chown -R $USER:$USER {site_root}/test.local.com
```

## Step 3: Create a Sample Index Page
```bash
echo "<h1>Example Site</h1>" | sudo tee {site_root}/example.local.com/index.html
echo "<h1>Test Site</h1>" | sudo tee {site_root}/test.local.com/index.html
```

## Step 4: Create Nginx Server Blocks
Create a new config file for each domain:
```bash
sudo nano /etc/nginx/sites-available/example.local.com
```
Add the following:
```nginx
server {
    listen 80;
    server_name example.local.com;
    root {site_root}/example.local.com;
    index index.html;
}
```
Do the same for `test.local.com`:
```bash
sudo nano /etc/nginx/sites-available/test.local.com
```
```nginx
server {
    listen 80;
    server_name test.local.com;
    root {site_root}/test.local.com;
    index index.html;
}
```

## Step 5: Enable the Configurations
```bash
sudo ln -s /etc/nginx/sites-available/example.local.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/test.local.com /etc/nginx/sites-enabled/
```

## Step 6: Restart Nginx
```bash
sudo systemctl restart nginx
```

## Step 7: Map IP in Hosts File

### On Linux (Ubuntu, MacOS, WSL)
Edit the hosts file:
```bash
sudo nano /etc/hosts
```
Add the following lines:
```
127.0.0.1 example.local.com
127.0.0.1 test.local.com
```
Save and exit.

### On Windows
1. Open Notepad as Administrator.
2. Open the file:
   ```
   C:\Windows\System32\drivers\etc\hosts
   ```
3. Add these lines at the bottom:
   ```
   127.0.0.1 example.local.com
   127.0.0.1 test.local.com
   ```
4. Save the file and close Notepad.
5. Flush DNS cache by running the following command in **Command Prompt (Admin)**:
   ```powershell
   ipconfig /flushdns
   ```

## Step 8: Test in Browser
Go to `http://example.local.com` and `http://test.local.com` in your browser.

### Done! 🚀

