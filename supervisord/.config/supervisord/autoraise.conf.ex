[program:autoraise]
redirect_stderr=true
autostart=true
command=/opt/local/bin/autoraise -delay 0 -focusDelay 1 -stayFocusedBundleIds "com.apple.SecurityAgent,com.apple.LocalAuthentication.UIAgent,com.zzd.Xnip"

