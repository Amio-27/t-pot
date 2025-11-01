# Custom T-Pot Web Interface Integration Guide

## ✅ INTEGRATION COMPLETE

The custom green-themed web interface has been successfully integrated with T-Pot's Docker setup!

## What Was Done

### 1. Files Created

- `web/index.html` - Custom green-themed landing page (no logo)
- `web/style.css` - Green styling with animations and effects

### 2. Docker Compose Files Modified

The following compose files have been updated to mount the custom web interface:

- ✅ `compose/standard.yml` - nginx service updated
- ✅ `compose/tpot_services.yml` - nginx service updated

**Added Volume Mount:**

```yaml
- ./web:/usr/share/nginx/html:ro
```

This mounts your custom `web/` directory into the nginx container, replacing the default web interface.

## How It Works

1. **T-Pot's nginx service** runs on port **64297** (HTTPS)
2. **Your custom web files** in the `web/` directory are mounted into the container
3. **When you access T-Pot**, you'll see your green-themed interface instead of the purple one
4. **The logo is removed**, replaced with a clean text-based title

## To See Your Custom Interface

1. **Start T-Pot with Docker Compose:**

   ```bash
   docker-compose -f compose/standard.yml up -d
   # or whichever compose file you're using
   ```

2. **Access the web interface:**

   - URL: `https://your-server-ip:64297`
   - You'll see your green-themed landing page

3. **Update the links** (optional):
   - Edit `web/index.html` to point menu items to actual T-Pot services
   - The links are currently placeholders (`href="#"`)

## Color Scheme Changed

- **From:** Purple/Magenta (`#ff00ff`, `#e91e63`, magenta)
- **To:** Green (`#00ff41`, `#228b22`, `#7fff7f`)
- **Logo:** Removed (replaced with text-based "T-POT" title)
- **Effects:** Added green glowing animations and interactive hover states

## Notes

- The web interface is mounted as **read-only** (`:ro`) for security
- Changes to `web/index.html` or `web/style.css` require restarting the nginx container
- The original T-Pot web interface is not modified, only overridden by the volume mount
