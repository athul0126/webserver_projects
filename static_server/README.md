# Static Website Hosting with Nginx

This guide explains how to host a pure static website (HTML, CSS, and JavaScript) using Nginx.

## Prerequisites

- A Linux server with Nginx installed (Ubuntu or Debian recommended)
- Basic knowledge of Linux command-line operations
- Your static website files (HTML, CSS, JS) ready

## Steps to Host a Static Website

### 1. Install Nginx (if not installed)

#### On Ubuntu/Debian:
```sh
sudo apt update
sudo apt install nginx -y
```

### 2. Configure Nginx for Static Hosting

1. Navigate to the Nginx configuration directory:
   ```sh
   cd /etc/nginx/sites-available/
   ```

2. Create a new configuration file:
   ```sh
   sudo nano /etc/nginx/sites-available/your-site.conf
   ```
   *(Replace `your-site.conf` with a meaningful filename.)*

3. Add the following content (modify the root path as needed):
   ```nginx
   server {
       listen 80;
       server_name your-domain.com;
       root /home/user/your-static-site;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }
   }
   ```

4. Create a symbolic link to enable the site:
   ```sh
   sudo ln -s /etc/nginx/sites-available/your-site.conf /etc/nginx/sites-enabled/
   ```
5. delete a config file inside the sites-enabled:
   ```sh
   sudo rm /etc/nginx/sites-enabled/default
   ```

5. Test the Nginx configuration:
   ```sh
   sudo nginx -t
   ```
   If there are no errors, restart Nginx:
   ```sh
   sudo systemctl restart nginx
   ```

### 3. Upload Your Website Files

1. Create the root directory for your website:
   ```sh
   sudo mkdir -p /home/user/your-static-site
   ```

2. Upload your `index.html`, `styles.css`, and `script.js` files to `/home/user/your-static-site/`.
   ```sh
   sudo cp -r /home/user/website/* /home/user/your-static-site/
   ```

3. Set proper permissions:
   ```sh
   sudo chown -R www-data:www-data /home/user/your-static-site
   sudo chmod -R 755 /home/user/your-static-site
   ```

### 4. Access Your Website

- Open your browser and visit `http://your-domain.com` (or `http://your-server-ip`).
- Your static site should now be live!

## Additional Configuration

- **Enable Gzip Compression**: Add `gzip on;` inside the `server` block to improve performance.
- **Enable HTTPS**: Use Let's Encrypt with Certbot for a free SSL certificate.
  ```sh
  sudo apt install certbot python3-certbot-nginx -y
  sudo certbot --nginx -d your-domain.com -d www.your-domain.com
  ```

## Troubleshooting

- Check Nginx logs if something isn’t working:
  ```sh
  sudo tail -f /var/log/nginx/access.log
  sudo tail -f /var/log/nginx/error.log
  ```
- Ensure the firewall allows HTTP and HTTPS:
  ```sh
  sudo ufw allow 'Nginx Full'
  ```

## Conclusion

You have successfully deployed a static website using Nginx! 🎉

