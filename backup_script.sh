#!/bin/bash

# Project Backup and GitHub Deployment Script

PROJECT_NAME="consitech"
BACKUP_DIR="/root/project_backups/${PROJECT_NAME}"
GITHUB_REPO="github.com/samcontreras/consitech_landingpage"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup project files
backup_project() {
    echo "🔄 Creating project backup..."
    
    # Backup project source code
    cp -R /path/to/project/source "$BACKUP_DIR/source"
    
    # Backup Nginx configuration
    cp /etc/nginx/sites-available/consitech "$BACKUP_DIR/nginx_config"
    
    # Backup SSL certificates
    cp -R /etc/letsencrypt/live/consitech.com.ar "$BACKUP_DIR/ssl_certs"
    
    # Backup environment files
    cp /path/to/project/.env "$BACKUP_DIR/.env"
    
    # Backup PM2 ecosystem config
    pm2 dump > "$BACKUP_DIR/pm2_ecosystem.json"
}

# Create GitHub repository backup
github_backup() {
    echo "🚀 Preparing GitHub backup..."
    
    # Navigate to backup directory
    cd "$BACKUP_DIR"
    
    # Initialize git repository
    git init
    
    # Configure git
    git config user.name "Backup Bot"
    git config user.email "backup@yourcompany.com"
    
    # Add all files
    git add .
    
    # Commit backup
    git commit -m "Full project backup - $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Add remote repository
    git remote add origin "https://github.com/${GITHUB_REPO}.git"
    
    # Push to GitHub
    git push -f origin main
}

# Restore function for new environment
restore_project() {
    echo "🔧 Restoring project on new machine..."
    
    # Clone repository
    git clone "https://github.com/${GITHUB_REPO}.git"
    
    # Restore Nginx configuration
    sudo cp nginx_config /etc/nginx/sites-available/consitech
    sudo ln -s /etc/nginx/sites-available/consitech /etc/nginx/sites-enabled/
    
    # Restore SSL certificates
    sudo cp -R ssl_certs /etc/letsencrypt/live/consitech.com.ar
    
    # Restore environment
    cp .env /path/to/project/
    
    # Install dependencies
    yarn install
    
    # Build project
    yarn build
    
    # Restore PM2 ecosystem
    pm2 startup
    pm2 restore
}

# Main execution
main() {
    case "$1" in
        backup)
            backup_project
            github_backup
            ;;
        restore)
            restore_project
            ;;
        *)
            echo "Usage: $0 {backup|restore}"
            exit 1
            ;;
    esac
}

main "$@"
