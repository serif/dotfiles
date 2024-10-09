#!/usr/bin/env bash
# Close button padding for WhiteSur


PROFILE_DIR="$HOME/.mozilla/firefox"
PROFILES_INI="$PROFILE_DIR/profiles.ini"

echo "Reading profiles.ini from $PROFILES_INI"

# Initialize PROFPATH variable
PROFPATH=""

# Read profiles.ini and prioritize default-release profile
PROFILE_ENTRIES=$(grep -E '^\[Profile|^Path|^Default' "$PROFILES_INI")

# Function to find profile path by type
find_profile_path() {
    local profile_name=$1
    local profile_info=$(echo "$PROFILE_ENTRIES" | awk "/\\[$profile_name\\]/,/^$/")
    echo "$profile_info" | grep '^Path=' | cut -d'=' -f2
}

# Try to find default-release profile first
PROFPATH=$(find_profile_path 'Profile0')

# If not found, fallback to default profile
if [ -z "$PROFPATH" ]; then
    echo "Default-release profile not found, looking for default profile."
    PROFPATH=$(find_profile_path 'Profile1')
fi

# Final fallback to first profile if both not found
if [ -z "$PROFPATH" ]; then
    echo "No default or default-release profile found, falling back to first profile."
    PROFPATH=$(grep -m 1 'Path=' "$PROFILES_INI" | sed 's/^Path=//')
fi

FULL_PROFPATH="$PROFILE_DIR/$PROFPATH"

if [ -z "$PROFPATH" ] || [ ! -d "$FULL_PROFPATH" ]; then
    echo "Error: Could not determine the profile path."
    exit 1
fi

echo "Determined profile path: $FULL_PROFPATH"

CHROME_DIR="$FULL_PROFPATH/chrome"
CHROME_FILE="$CHROME_DIR/userChrome.css"
USER_JS="$FULL_PROFPATH/user.js"

echo "Creating chrome directory at $CHROME_DIR"
mkdir -p "$CHROME_DIR"

echo "Ensuring userChrome.css exists at $CHROME_FILE"
touch "$CHROME_FILE"

CSS_RULE=".titlebar-close{margin-right:13px!important}"

# Add the CSS rule if it doesn't already exist
if ! grep -qF "$CSS_RULE" "$CHROME_FILE"; then
    echo "Adding CSS rule to userChrome.css"
    echo "$CSS_RULE" >> "$CHROME_FILE"
else
    echo "CSS rule already exists in userChrome.css"
fi

# Add the preference if it doesn't already exist
PREF_RULE='user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);'
if [ ! -f "$USER_JS" ] || ! grep -qF "$PREF_RULE" "$USER_JS"; then
    echo "Adding preference to user.js"
    echo "$PREF_RULE" >> "$USER_JS"
else
    echo "Preference already exists in user.js"
fi

echo "Script completed"

